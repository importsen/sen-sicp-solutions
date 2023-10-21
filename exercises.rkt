
#lang sicp

;=============================================================================
; 1.1 

;10
;10

;(+ 5 3 4)
;12

;(- 9 1)
;8

;(/ 6 2)
;3

;(+ (* 2 4) (- 4 6))
;6

;(define a 3)
;3 will not print to terminal

;(define b (+ a 1))
;4 will not print to terminal

;(+ a b (* a b))
;19

;(= a b)
;#f

;(if (and (> b a) (< b (* a b)))
;  b
;  a)
;4 

;(cond ((= a 4) 6)
;      ((= b 4) (+ 6 7 a))
;      (else 25))
;16

;(+ 2 (if (> b a) b a))
;6

;(* (cond ((> a b) a)
;         ((< a b) b) 
;         (else -1))
;   (+ a 1))
;16

;=============================================================================
;1.2

;(/ (+ 5 4 (- 2 
;             (- 3 (+ 6 (/ 4 5)))))
;   (* 3 (- 6 2)(- 2 7)))

;=============================================================================
; 1.3

;(define (square x) (* x x))

;(define (sum-of-squares x y)
; (+ (square x) (square y)))

;(define (bigger-numbs a b c)
;  (cond ((and (< a b) (< a c)) (sum-of-squares b c))
;        ((and (< b a) (< b c)) (sum-of-squares a c))
;        (else (sum-of-squares a b))))
        
;(bigger-numbs 1 2 3)
;(bigger-numbs 3 2 1)

;(bigger-numbs -4 23 1)
;(bigger-numbs 23 1 -4)

;=============================================================================
;1.4

;(define (a-plus-abs-b a b)
;  ((if (> b 0) + -) a b))

;(a-plus-abs-b 1 2)
;(a-plus-abs-b -1 2)
;(a-plus-abs-b -2 -4)
;(a-plus-abs-b -2 -2)

; from my observatons this procedure adds a and the absolute value of b. 
; if b is positive a and b is added, if it's a b is a negitive number, it
; subtracts a from b, insureing that b returns as a postive number regardless
; if a is a positive or negitive number. 

;=============================================================================
;1.5

; NOTE running this procedure will cause a endless loop

; (define (test x y)
;  (if (= x 0)
;      0
;      y))

; (test 0 (p))
; (test 1 (p))
; (test -1 (p))

; with applicative order the (p) procedure will be in a infinite loop
; because p will evalutate itself.
;
; in a normal order the interpreter will "fully expand and reduce" which 
; result with 0 or p being returned if its not equal to 0.

;=============================================================================
; 1.6

;(define (square-1.6 x) (* x x)) 
; NOTE repeated procedure's name will be suffixed with execerise number to 
; avoid dublicate indentifier errors running this module.

;(define (abs x)
;  (cond ((< x 0) (- x))
;        (else x)))

; original procedure
; (define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                 x)))
; modified procedure

;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))

;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x) ; == 1.0, not good-enough? 1.0 2
;      guess ; == 2
;     (sqrt-iter (improve guess x) 
;                 x)))

;(define (improve guess x)
;  (average guess (/ x guess)))

;(define (average x y)
;  (/ (+ x y) 2))

;(define (good-enough? guess x)
;  (< (abs (- (square-1.6 guess) x)) 0.001))

;(define (sqrt x)
;  (sqrt-iter 1.0 x))
;(new-if 1.0 2)

; running the program with the new procedure, it will cause a endless loop.
; this is because its only evaluating the then-clause and else-clause and
; not the predicates. "if" is a special form that will evalutate 2 cases 
; correctly so it can pass on the proper evaluation to the procedures inside.

;=============================================================================

; 1.7


;(define (square x) (* x x))

;(define (abs x)
;  (cond ((< x 0) (- x))
;        (else x)))

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                 x)))

;(define (improve guess x)
;  (average guess (/ x guess)))

;(define (average x y)
;  (/ (+ x y) 2))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

;(define (sqrt x)
;  (sqrt-iter 1.0 x))

;(sqrt 1234567890123)
;(sqrt 12345678901234) running this will not finish the program.
;(sqrt 12345678901230)
;(sqrt 0.000000000123)
;(square (sqrt 0.000000000123))

; if the number is large enough, the program will not be able to compute
; the program. even with very small numbers the result will be inaccurate.
;
; this is due to how numbers are computed in the lowest level in the machine.
; the machine's has a finte amount of space to compute numbers and floating
; points are rounded out. this program is conflicting that logic. thus for 
; extremely large numbers the square root program will never finish. 
;
; for small numbers its not useful when the initial guess quickly becomes 
; smaller then 0.001. 
;
; alternative procedure:
; (define (good-enough? previous-guess guess)
;   (< (abs (/ (- guess previous-guess) guess)) 0.00000000001)
;
;=============================================================================
;1.8

;(define (square x)(* x x))
;  (define (cube-root-iter guess previous-guess x)
;    (if (good-enough? guess previous-guess)
;        guess
;        (cube-root-iter (improve guess x)
;                  guess
;                  x)))
;  (define (average x y)
;    (/ (+ x y) 2))
;  (define (improve guess x)
;    (/ (+ (/ x (* guess guess))
;          (* 2 guess)) 
;    3))
;  (define (good-enough? previous-guess guess)
;    (< (abs (- guess previous-guess)) 0.001))
;  (define (cube-root x)
;    (cube-root-iter 1.0 0 x))

;(cube-root 25)


;=============================================================================
;1.9

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

(+ 4 5)
