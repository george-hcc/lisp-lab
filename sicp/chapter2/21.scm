#lang sicp

;Square-list complete version
;(define (square-list items)
;  (if (null? items)
;      nil
;      (cons (square (car items)) (square-list (cdr items)))))

;Square-list map version
(define (square-list items)
  (map square items))

(define (square x) (* x x))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))