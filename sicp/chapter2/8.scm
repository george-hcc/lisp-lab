#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound intv) (car intv))
(define (upper-bound intv) (cdr intv))

(define (add-interval intv1 intv2)
  (make-interval (+ (lower-bound intv1) (lower-bound intv2))
                 (+ (upper-bound intv2) (upper-bound intv2))))

(define (sub-interval intv1 intv2)
  (make-interval (- (lower-bound intv1) (upper-bound intv2))
                 (- (upper-bound intv1) (lower-bound intv2))))

(define (mul-interval intv1 intv2)
  (let ((p1 (* (lower-bound intv1) (lower-bound intv2)))
        (p2 (* (lower-bound intv1) (upper-bound intv2)))
        (p3 (* (upper-bound intv1) (lower-bound intv2)))
        (p4 (* (upper-bound intv1) (upper-bound intv2))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval intv1 intv2)
  (mul-interval intv1
                (make-interval (/ 1.0 (upper-bound intv2))
                               (/ 1.0 (lower-bound intv2)))))