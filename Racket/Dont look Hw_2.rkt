#lang Plai-typed


; The internal semantic representation for the arithmetic
; expressions language
; (the C stands for "core" language)
(define-type ArithC
  [numC (n : number)]
  [plusC (left : ArithC) (right : ArithC)]
  [multC (left : ArithC) (right : ArithC)] ;; initiated the multiplication here so its part of ArithC
  )


#|
(define (good? [AC : ArithC]) : boolean 
  (type-case ArithC AR
    [numC (n) (numbers) ]
    [plusC ((numC) (numC)) number]))
|#

; remember the REPL
; eval has two parts, the parser and the interpreter
; (print (eval (read))) --> 
;     (print (interpret (parse (read))))

; the parser takes in an s-expression 
; and returns the internal representation of the program
(define (parse [s : s-expression]) : ArithC
  (cond
    [(s-exp-number? s) (numC (s-exp->number s))]
    [(and (s-exp-list? s) (= 3 (length (s-exp->list s))))
     (let ([sl (s-exp->list s)])
       (case (s-exp->symbol (first sl))
         [(+) (plusC (parse (second sl)) (parse (third sl)))]
         [(*) (multC (parse (second sl)) (parse (third sl)))]  ;; parsed my  multiplication so that it can take more than 3 items.
         [else (error 'parse "syntax error")]))]
     [else (error 'parse "syntax error")]
    ))

; the interpreter takes the internal representation
; of the program, executes it, and returns the result

(define (interp [a : ArithC]) : number
  (type-case ArithC a
    [numC (n) n]
    [plusC (l r) (+ (interp l) (interp r))]
    [multC (l r) (* (interp l) (interp r))]
))

#|   Simply an Example
(test(insertion-sort(list 1 2 3 ) ) (list 1 2 3 ))
(test(insertion-sort(list 3 2 1 ) ) (list 1 2 3 ))
(test(insertion-sort(list 1 3 1 ) ) (list 1 1 3 ))
|# 