#lang sicp

(define (weigth-sum proc next weigth a b i)
  (if (> a b)
      0
      (+ (* (weigth a b i) (proc a))
         (weigth-sum proc next weigth (next a) b (+ i 1)))))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (/ (* (weigth-sum f
                      (lambda (x) (+ x h))
                      (lambda (a b i) (cond ((or (= i 0) (= a b)) 1)
                                            ((even? i) 2)
                                            (else 4)))
                      a
                      b
                      0)
          h)
       3)))

(define (cube x) (* x x x))

(simpson cube 0 1 2)