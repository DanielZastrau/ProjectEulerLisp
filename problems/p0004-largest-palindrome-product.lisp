(defpackage #:project-euler/problems/p0004-largest-palindrome-product
    (:nicknames #:p0004)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0004-largest-palindrome-product)

(declaim (optimize (speed 3) (safety 0) (debug 0)))
(defun main () ()
    (let ((largest-palindrome 0)) (declare (type fixnum largest-palindrome))
    (loop for n1 from 100 below 1000
        do (loop for n2 from n1 below 1000
            do (let ((n (* n1 n2))) (declare (type fixnum n))
                (if (and (palindrome-p n (reverse-num n)) (> n largest-palindrome) )
                    (setf largest-palindrome n) ) ) ) )
    largest-palindrome) )

(defun solve () (main))
