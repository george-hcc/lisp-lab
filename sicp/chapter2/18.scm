#lang sicp

(define (reverse lst)
  (define (iter lst rev-lst)
    (let ((cdr-lst (cdr lst)))
      (if (null? cdr-lst)
          (cons (car lst) rev-lst)
          (iter cdr-lst (cons (car lst) rev-lst)))))
  (iter (cdr lst) (cons (car lst) nil)))

(reverse (list 1 2 3 4 5))

  
  