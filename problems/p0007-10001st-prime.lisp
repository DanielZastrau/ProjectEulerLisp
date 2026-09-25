(defpackage #:project-euler/problems/p0007-10001st-prime
    (:nicknames #:p0007)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0007-10001st-prime)

(defun solve () (nth 10001 (eratosthenes (expt 10 8))))