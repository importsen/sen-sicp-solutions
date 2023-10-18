#lang sicp

(define (square x) (* x x)) 

(define (square-2 x)
  (exp (double (log x))))

(define (double x) (+ x x))

(double 3)
(log 2)
(square-2 2)
(square 2)
(exp 2)
(exp (double (log 2)))
