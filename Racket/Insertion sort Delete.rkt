#lang plai-typed

(define (insert-order a x y z) 
  (cond 
    [ (>= a (x



(define (insertion-sort [x : (listof number)] y z ) : (listof number) 
    [ ( < y z) (insertion-sort x y (- z 1)) (insert-order((first x) x y z))]
