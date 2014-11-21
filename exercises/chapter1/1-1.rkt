;;;; SICP Exercises 1.1 - 1.6
;;;; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html
#lang racket

;; Exercise 1.1
(displayln "Exercise 1.1")

10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))


;; Exercise 1.2
(displayln "Exercise 1.2")

(/ (+ 5 1/2 (- 2 (- 3 (+ 6 1/3))))
   (* 3 (- 6 2) (- 2 7)))


;; Exercise 1.3
(displayln "Exercise 1.3")

(define (sum-of-square-of-largest-2 x y z)
  (cond ((> x y z) (+ (* x x) (* y y)))
        ((> y x) (sum-of-square-of-largest-2 y x z))
        ((> z y) (sum-of-square-of-largest-2 x z y))))

(= (sum-of-square-of-largest-2 3 4 5)
   (sum-of-square-of-largest-2 4 5 3)
   (sum-of-square-of-largest-2 5 3 4))
    

;; Exercise 1.4
(displayln "Exercise 1.4")
(displayln "Operand (+ or -) is chosen based on whether b is positive number.\r\n")

;; Exercise 1.5
(displayln "Exercise 1.5")

(displayln "Applicative Order will evaluate (p) in (test 0 (p)) before test is invoked causing an infinite loop.\n")
(displayln "Normal Order will not evaluate (p) and the expression (test 0 (p)) will resolve to 0.\n")

;; Exercise 1.6
(displayln "Exercise 1.6")
(displayln "The problem with new-if is that the else clause is always evaluated unlike \"if\", which in this scenerio will cause sqrt-iter to be inoked every time even when the guess is \"good-enough?\" leading to an infinite loop.")
(displayln "Run or step through (sqrt 2) to test.\n")

(define (square x) (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
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

;; Exercise 1.7
(displayln "Exercise 1.7 - SKIPPED")


;; Exercise 1.8
(displayln "Exercise 1.8 - SKIPPED")



