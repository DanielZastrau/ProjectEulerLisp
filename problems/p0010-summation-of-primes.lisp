(defpackage #:project-euler/problems/p0010-summation-of-primes
    (:nicknames #:p0010)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0010-summation-of-primes)

(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun main (limit) (declare (type fixnum limit))
    (let ((total-sum 0) (primes (eratosthenes limit)))
        (declare (type fixnum total-sum) (type list primes))
        (loop for prime of-type fixnum in primes do (incf total-sum prime))
    total-sum) )

(defun solve () (main (* 2 (expt 10 6))))
