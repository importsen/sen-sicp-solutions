#lang sicp

;=============================================================================
;1.2.2 tree recursion

;bad optimization

;(define (fib n)
;  (cond ((= n 0) 0)
;        ((= n 0) 1)
;        (else (+ (fib (- n 1))
;                 (fib (- n 2))))))


;(define (fib n)
;  (fib-iter 1 0 n))

;(define (fib-iter a b count)
;  (if (= count 0)
;      b 
;      (fib-iter (+ a b) a (- count 1))))

; fib 10 = 1 0 10
; fib-iter 1 0 9
; fib-iter 1 1 8
; fib-iter 2 1 7
; fib-iter 3 2 6
; fib-iter 5 3 5
; fib-iter 8 5 4
; fib-iter 13 8 3
; fib-iter 21 13 2
; fib-iter 34 21 1
; fib-iter 55 34 0
; if count = 0, b 
; so b is 55 thus (fib 10) = 55

; (fib 10)

;=============================================================================
; example: counting change

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


(count-change 100)
