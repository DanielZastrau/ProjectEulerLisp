(defpackage #:project-euler/problems/p0042-coded-triangle-numbers
    (:nicknames #:p0042)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0042-coded-triangle-numbers)

(defun triangle-number (n) (declare (type fixnum n)) (* 0.5 n (+ n 1)))

(defun triangle-numbers () (loop for n from 1 to 100 collect (triangle-number n)))

(defun main ()
    (let ((count 0)  (nums (triangle-numbers)))
    (loop for word in (read-words (problem-data "0042_words.txt")) 
        do (let ((total 0)) 
            (loop for char across word do (setf total (+ total (- (char-code char) 64))))
            (if (member total nums :test #'=) (setf count (+ count 1)))))
    count))

(defun solve () (main))
