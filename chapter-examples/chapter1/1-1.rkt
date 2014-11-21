;;;; SICP - 1.1  The Elements of Programming
;;;; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html
(displayln "1.1  The Elements of Programming")
#lang racket

;;; 1.1.1  Expressions
(displayln "1.1.1  Expressions")
486

(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

(+ 21 35 12 7)

(* 25 4 12)

(+ (* 3 5) (- 10 6))

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

;;; 1.1.2  Naming and the Environment
(displayln "1.1.2  Naming and the Environment")

(define size 2)

size
(* 5 size)

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))

(define circumference (* 2 pi radius))
circumference

;;; 1.1.3  Evaluating Combinations
(displayln "1.1.3  Evaluating Combinations")

(* (+ 2 (* 4 6))
   (+ 3 5 7))

;;; 1.1.4  Compound Procedures
(displayln "1.1.4  Compound Procedures")

(define (square x) (* x x))

(square 21)

(square (+ 2 5))

(square (square 3))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(f 5)

;;; 1.1.5  The Substitution Model for Procedure Application
(displayln "1.1.5  The Substitution Model for Procedure Application")

; Applicative Order Evaluation
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136

; Normal Order Evaluation
(f 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square (+ 5 1)) (square (* 5 2)))
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136

;;; 1.1.6  Conditional Expressions and Predicates
(displayln "1.1.6  Conditional Expressions and Predicates")

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (abs2 x)  ; renamed to abs2 to prevent error "module: duplicate definition for identifier in: abs"
  (cond ((< x 0) (- x))
        (else x)))

(define (abs3 x)
  (if (< x 0)
      (- x)
      x))

(define (>= x y)
  (or (> x y) (= x y)))

;;; 1.1.7  Example: Square Roots by Newton's Method
(displayln "1.1.7  Example: Square Roots by Newton's Method")

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))


;;; 1.1.8  Procedures as Black-Box Abstractions
(displayln "1.1.8  Procedures as Black-Box Abstractions")

(define (square2 x) (* x x))

(define (square3 x) (exp (double (log x))))
(define (double x) (+ x x))

;; sqrt2 defined by block structure
(define (sqrt2 x)
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))
  
  (define (improve guess x)
    (average guess (/ x guess)))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  
  (sqrt-iter 1.0 x))

(sqrt2 4) ; invoke procedure for testing

;; sqrt3 defined by block structure with lexical scoping (of x)
;; note the necessary changes to 'average' (which is not a built-in Racket function)
(define (sqrt3 x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (average num1 num2)
    (/ (+ num1 num2) 2))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  
  (sqrt-iter 1.0))

(sqrt3 4) ; invoke procedure for testing
