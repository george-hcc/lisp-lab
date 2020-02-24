#lang sicp

;Accumulate with filter function
(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) result))))
  (iter a null-value))

;Filtered Sum
(define (filtered-sum filter term a next b)
  (filtered-accumulate filter + 0 term a next b))

;Filtered Product
(define (filtered-prod filter term a next b)
  (filtered-accumulate filter * 1 term a next b))

;Prime finder filter
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (square x) (* x x))
(define (divides? a b)
  (= (remainder a b) 0))

;Sum of squared primes between a and b
(define (squared-primes-sum a b)
  (filtered-sum prime?
                square
                a
                (lambda (x) (+ x 1))
                b))

;Euler's GCD
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;Product of all relative-primes of n
(define (relative-primes-prod n)
  (filtered-prod (lambda (x) (= (gcd x n) 1))
                 (lambda (x) x)
                 2
                 (lambda (x) (+ x 1))
                 n))