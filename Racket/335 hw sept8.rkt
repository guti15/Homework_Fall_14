#lang plai-typed 
; tried using "last" but for some reason it did not like the syntax through out the middle not sure why
; so decide to use second 

;helper function 
(define (insert-sort x y)
  (cond 
    ; incomplete 
    
 

(define (insertion-sort [x : (listof number)]) : (listof number) 
  
  (cond 
   [ (empty? x) (error 'insertion-sort"empty-list"
    [(< (first x) (second x)) (insertion-sort (rest x))
    [(> (first x) (second x)) (cons(first x) rest x)]
                            
                            
    ;[(> (first x) (last x)) (null x ) ])) ; make helper function and call it
  
    
    
 
