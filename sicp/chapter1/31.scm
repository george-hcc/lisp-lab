#lang sicp

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1.0))

(define (fact n)
  (product (lambda (x) x)
           2
           (lambda (x) (+ x 1))
           n))

(define (pi-prod b)
  (* (product (lambda (a) (if (even? a)
                              (/ (+ a 2) (+ a 1))
                              (/ (+ a 1) (+ a 2))))
              1
              (lambda (a) (+ a 1))
              b)
     4))