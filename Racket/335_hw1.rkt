#lang plai-typed
;; Create a helper function 

(define (insertion-sort [x :(listof number)] [ num : number ]) : (listof number) ;; returns a list of numbers
  (cond 
    [(empty? x) (list num) ] ; is there a value x  list numbers 
    [(<= num (first x)) (cons num x)]  ; evaluate if the number is less than the, cons gives me a pairs
    [else (cons (first x) (insertion-sort (rest x) num) ) ] ) ) ; this calls the function recursively 



    





(define(insertion-sort[x:(listof number)]):(listof number)
 [cond 
   ; look at "first" and then compare to the rest 
  
  #| procedures compleate and Close parenthesis |#
  
   ;Tests:
  
  (test(insertion-sort(list 1 2 3 ) ) (list 1 2 3 ))
  (test(insertion-sort(list 3 2 1 ) ) (list 1 2 3 ))
  (test(insertion-sort(list 1 3 1 ) ) (list 1 1 3 ))

  (test(insertion-sort(list 1 ) ) (list 1))
  (test(insertion-sort empty))(empty))
  
  
  