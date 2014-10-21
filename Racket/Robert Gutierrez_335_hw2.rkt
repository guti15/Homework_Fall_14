#lang plai-typed

; The internal semantic representation for the arithmetic
; expressions language
; (the C stands for "core" language)
(define-type ArithC
  [numC (n : number)]
  [plusC (left : ArithC) (right : ArithC)]
  [multC (left : ArithC) (right : ArithC)]
  [ifC (testC : ArithC ) (thenC : ArithC ) (elseC : ArithC)]
  
  )

;(define (ifC (Testcase : s-expression)(ThenCase : s-expression)(elseCase : s-expression)): number
 ;[ifC (plusC (numC
  
  
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
         [(*) (multC (parse (second sl)) (parse (third sl)))]
         [(ifC) (ifC (parse (second sl)) (parse (third sl)) (parse (fourth sl)))]
         [else (error 'parse "syntax error")]))]
     [else (error 'parse "syntax error")]
    ))


(define (eval [ e : s-expression]) : number
  (interp (parse e)))

  
              
; the interpreter takes the internal representation
; of the program, executes it, and returns the result


;;(define (eval [s : s-expression]) : number
  ;; call both interp and parse  

;; variable t 
(define (interp [a : ArithC]) : number
  (type-case ArithC a
    [numC (n) n]
    [plusC (l r)   (+ (interp l) (interp r))]
    [multC (l r)   (* (interp l) (interp r))]
    [ifC (tes thn els) 
         (cond
           [(=(interp tes) 0) (interp thn)]
           [else (interp els)]
                     
)]))


(test (parse '2) (numC 2))
(test(parse '(+ 1 2))  (plusC (numC 1) (numC 2) ) )
(test(interp (numC 5)) 5)
(test(interp (plusC (numC 3) (numC 4))) 7)

(test (parse '(* 3 4)) (multC (numC 3)(numC 4)))
(test(interp(multC (numC 5)(numC 6))) 30)

(test (interp(ifC (plusC (numC 4) (numC -4)) 
                  (multC (numC 22) (numC 2)) 
                  (plusC (numC 3) (numC 4)))) 44)

(test (interp (ifC(multC (numC 3)(numC 0))
                  (multC (numC 2)(numC 22)) (plusC (numC 3) (numC -4)))) 44)




(test (interp(ifC (plusC (numC 4) (numC -4)) (multC (numC 22) (numC 2)) (plusC (numC 3)(numC 2)))) 44)