(defpackage #:project-euler/problems/p0053-combinatoric-selections
    (:nicknames #:p0053)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0053-combinatoric-selections)

(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun binomial-exceeds-p (n k threshhold)
    (declare (type (integer 0 101) n k) (type (integer 0 #.(expt 10 8)) threshhold))
    (let ((total 1)) (declare (type fixnum total))
    (loop for i of-type fixnum from 1 to k do
        (setf total (truncate (the fixnum (* total (the fixnum (+ (- n k) i)))) i))
        (if (> total threshhold) (return t)))))

(defun main (limit threshhold)
    (declare (type fixnum limit threshhold))
    (let ((total 0)) (declare (type fixnum total)) 
    (loop for n of-type fixnum from 1 to limit do
        (loop for k of-type fixnum from 1 to n do
            (if (binomial-exceeds-p n k threshhold) (incf total 1) )))
    total) )

(defun solve () (main 100 #.(expt 10 6)))
