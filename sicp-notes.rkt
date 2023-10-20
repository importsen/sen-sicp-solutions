#lang sicp

; linear recursion
;(define (factorial n)
; (if (= n 1)
;    1
;    (* n (factorial (- n 1)))))

;(factorial 6)

; linear iterative
(define factorial)
  (fact-iter 1 1 n)

(define (fact-iter product counter max-count)
  (if (> counter max-count)
    product
    (fact-iter (* counter product)
               (+ counter 1)
               max-count)))

; block structure
;(define (factorial n)
; (define (iter product counter)
;   (if (> counter n)
;       product
;       (iter (* counter product)
;             (+ counter 1))))
; (iter 1 1)
