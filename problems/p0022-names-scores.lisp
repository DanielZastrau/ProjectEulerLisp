(defpackage #:project-euler/problems/p0022-names-scores
    (:nicknames #:p0022)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0022-names-scores)

(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun main ()
    (let ((words (sort (read-words (problem-data "0022_names.txt")) #'sb-unicode:unicode<)) (total 0)) (declare (type list words) (type fixnum total))
    (loop for word of-type simple-string in words  for i of-type fixnum from 1 do
        (let ((word-total 0)) (declare (type (integer 0 #.(expt 10 12)) word-total))
        (loop for char across word do (incf word-total (- (char-code char) 64)))
        (incf total (the fixnum (* word-total i)))))
    total))

(defun solve () (main))
