#lang sicp

(define (last-pair lst)
  (let ((end-lst (cdr lst)))
    (if (null? end-lst)
        lst
        (last-pair end-lst))))