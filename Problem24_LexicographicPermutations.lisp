(eval-when (:compile-toplevel :load-toplevel :execute)
    (load "C:\\Users\\danie\\Documents\\projects\\ProjectEulerLisp\\commons.lisp"))

(defpackage :p024 (:use :cl :commons))
(in-package :p024)

(defun integer-of (perm)
    (reduce (lambda (acc d) (+ (* 10 acc) d)) perm :initial-value 0))

(defun main ()
    (let ((permutations (distinct-permutations (list 0 1 2 3 4 5 6 7 8 9) :mode 0 :len 0)))
    (setf permutations (mapcar #'integer-of permutations))
    (nth (- (expt 10 6) 1) permutations)))

(defun execute () (print "Began") (terpri) (time (print (main))))