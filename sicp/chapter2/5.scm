#lang sicp

;Arithmetic Cons
(define (cons a b)
  (* (pow 2 a)
     (pow 3 b)))

;Power function
(define (pow base exp)
  (define (iter base exp result)
    (if (= exp 0)
        result
        (iter base (- exp 1) (* result base))))
  (iter base exp 1))

;Car and Cdr for the new type of arithmetic pair
(define (car pair)
  (find-exp pair 2))
(define (cdr pair)
  (find-exp pair 3))

;Find the expoent of a base that compose a number
(define (find-exp x base)
  (define (iter x base count)
    (if (= (remainder x base) 0)
        (iter (/ x base) base (+ count 1))
        count))
  (iter x base 0))