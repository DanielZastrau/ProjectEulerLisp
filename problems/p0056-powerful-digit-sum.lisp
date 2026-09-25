(defpackage #:project-euler/problems/p0056-powerful-digit-sum
    (:nicknames #:p0056)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0056-powerful-digit-sum)

(defun main ()
    (let ((mx 0) (num 0) ) (declare (type fixnum mx) (type integer num))
    (loop for a of-type fixnum from 1 below 100 do
        (loop for b of-type fixnum from 1 below 100 do
            (setf num (digitsum (expt a b)))
            (if (> num mx) (setf mx num))))
    mx))

(defun solve () (main))
