(defpackage #:project-euler/problems/p0025-1000-digit-fib-number
    (:nicknames #:p0025)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0025-1000-digit-fib-number)

(defun main () () (do ((a 1 b) (b 1 (+ a b)) (index 2 (+ index 1))) ((> b (expt 10 999)) index)))

(defun solve () (main))
