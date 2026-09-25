(defpackage #:project-euler/problems/p0003-largest-prime-factor
    (:nicknames #:p0003)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0003-largest-prime-factor)

(defun find-largest-prime-factor (n)
    (declare (type fixnum n))
    (let ((primes (eratosthenes (truncate (sqrt n))))  (maximum 0)  (current n))
        (declare (type fixnum current maximum) (type list primes)) 
        (loop for prime of-type fixnum in primes
            while (> current 1)
            when (zerop (mod current prime))
                do  (setf maximum prime)
                    (loop while (zerop (mod current prime)) do (setf current (the fixnum (/ current prime)) ) ) )
        (if (= current 1) maximum current) ) )

(defun solve () (find-largest-prime-factor 600851475143))
