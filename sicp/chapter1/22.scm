#lang sicp

;Square root growth smallest divisor algorithm
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (square x) (* x x))
(define (divides? a b)
  (= (remainder a b) 0))

;Prime finder
(define (prime? n)
  (= n (smallest-divisor n)))

;Find first n primes starting from a
(define (n-primes n a counter)
  (cond ((= counter n) (display "done!"))
        (else
         (cond ((prime? a) (display a) (newline) (n-primes n (+ a 1) (+ counter 1)))
               (else (n-primes n (+ a 1) counter))))))

;Measurer the algorithm's time
;The algorithm find the first three primes after 'a'
(define (alg-chronos a)
  (start-proc (runtime) a))
(define (start-proc start-time a)
  (n-primes 3 a 0)
  (newline)
  (display (- (runtime) start-time))
  (display " microseconds"))