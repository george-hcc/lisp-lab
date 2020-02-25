#lang sicp

;Segment's procedures
(define (make-segment pa pb)
  (cons pa pb))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

;Point's procedures
(define (make-point x y)
  (cons x y))
(define (point-x p)
  (car p))
(define (point-y p)
  (cdr p))

;Print a point
(define (print-point p)
  (display "(")
  (display (point-x p))
  (display ", ")
  (display (point-y p))
  (display ")"))

;Find the midpoint of a segment
(define (midpoint-segment seg)
  (make-point (/ (+ (point-x (start-segment seg))
                                 (point-x (end-segment seg)))
                              2.0)
                           (/ (+ (point-y (start-segment seg))
                                 (point-y (end-segment seg)))
                              2.0)))

;EXAMPLE!
(define seg (make-segment (make-point 1 2) (make-point 3 5)))
(display "Point A: ")
(print-point (start-segment seg))
(newline)
(display "Point B: ")
(print-point (end-segment seg))
(newline)
(display "Midpoint: ")
(print-point (midpoint-segment seg))