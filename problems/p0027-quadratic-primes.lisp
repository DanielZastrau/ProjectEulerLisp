(defpackage #:project-euler/problems/p0027-quadratic-primes
    (:nicknames #:p0027)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0027-quadratic-primes)

(declaim (inline end-of-prime-sequence quadratic))

(defun nums (limit) (loop for n from (* -1 limit) to limit collect n))

(defun quadratic (b c n) (+ (* n n) (* b n) c))

(defun end-of-prime-sequence (b c) (do ((x 0 (+ x 1))) ((not (prime-p (quadratic b c x))) x)))

(defun main (limit)
    (let ((primes (eratosthenes limit)) (ns (nums limit)) (x 0) (mx-n 0) (mx-b 0) (mx-c 0))
    (dolist (b ns (* mx-b mx-c))
        (dolist (prime primes)
            (setf x (end-of-prime-sequence b prime))
            (if (> x mx-n) (setf mx-n x mx-b b mx-c prime))))
    (* mx-b mx-c)))

(defun solve () (main 1000))
