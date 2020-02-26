#lang sicp

(define (same-parity first . rest)
  (define (iter sub-list parity)
    (if (= parity (remainder (car sub-list) 2))
        (if (null? (cdr sub-list))
            (cons (car sub-list) nil)
            (cons (car sub-list) (iter (cdr sub-list) parity)))
        (if (null? (cdr sub-list))
            nil
            (iter (cdr sub-list) parity))))
  (iter (cons first rest) (remainder first 2)))