(defpackage #:project-euler/problems/p0005-smallest-multiple
    (:nicknames #:p0005)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0005-smallest-multiple)

(defun main (limit) (declare (type fixnum limit))
    (let ((primes (eratosthenes limit))  (powers '())) (declare (type list primes))
        (loop for prime in primes do (push (floor (/ (log limit 10) (log prime 10))) powers) )
        
        (let ((n 1)) (declare (type fixnum n))
            (loop for prime in primes for power in (reverse powers) do (setf n (* n (expt prime power))) )
            n) ) )

(defun solve () (main 20))
