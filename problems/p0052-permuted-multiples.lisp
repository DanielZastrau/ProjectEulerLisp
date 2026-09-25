(defpackage #:project-euler/problems/p0052-permuted-multiples
    (:nicknames #:p0052)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0052-permuted-multiples)

(declaim (inline multiples) (optimize (speed 3) (safety 0) (debug 0)))

(defun multiples (n) (declare (type (integer 0 10000000) n)) (list n (* 2 n) (* 3 n) (* 4 n) (* 5 n) (* 6 n)))

(defun contain-same-digits (l) (declare (type list l))
    (let ((digits (sort (digits (nth 0 l)) #'<)) (out t))
        (declare (type list digits) (type boolean out))
        (loop for n in l do (if (not (equal digits (sort (digits n) #'<))) (setf out nil)))
    out))

(defun main ()
    (let ((starts '(1 10 100 1000 10000 100000 1000000)) (out 0))
        (declare (type list starts) (type fixnum out))
        (loop for start of-type fixnum in starts do
            (if (loop for n of-type fixnum from start below (* start 10) do
                    (if (contain-same-digits (multiples n)) (progn (print n) (setf out n) (return t)))
                    (if (> (* 6 n) (* 10 start)) (return nil)))
                (return out)))
    out))

(defun solve () (main))
