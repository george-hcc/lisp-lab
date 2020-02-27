#lang sicp

(define (reverse items) 
  (define (iter items result) 
    (if (null? items) 
        result
        (if (pair? (car items))
            (iter (cdr items) (cons (reverse (car items)) result))
            (iter (cdr items) (cons (car items) result)))))
  
  (iter items nil))