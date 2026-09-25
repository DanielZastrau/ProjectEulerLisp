(defpackage #:project-euler/problems/p0048-self-powers
    (:nicknames #:p0048)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0048-self-powers)

(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun main (limit) (declare (type fixnum limit))
    (let ((total 0) (s '"")) (declare (type integer total) (type string s))
        (loop for i of-type fixnum from 1 to limit do (incf total (expt i i)))
        (setf s (write-to-string total))
        (subseq s (- (length s) 10)) ) )

(defun solve () (main 1000))
