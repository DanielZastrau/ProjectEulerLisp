(defpackage #:project-euler/problems/p0097-large-non-mersenne-prime
    (:nicknames #:p0097)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0097-large-non-mersenne-prime)

(defun main ()
    (let ((n 1) (s 0) (modulos (expt 10 10)))
    (dotimes (iteration 7830457)
        (incf n n)
        (setf n (mod n modulos)))
    (dotimes (iteration 28433)
        (incf s n)
        (setf s (mod s modulos)))
    (+ s 1)))

(defun solve () (main))
