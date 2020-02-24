#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (integral f a b dx)
  (* dx
     (sum f
          (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b)))

(define (fact n)
  (product (lambda (x) x)
           2
           (lambda (x) (+ x 1))
           n))