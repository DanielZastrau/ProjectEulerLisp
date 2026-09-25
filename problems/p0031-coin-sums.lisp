(defpackage #:project-euler/problems/p0031-coin-sums
    (:nicknames #:p0031)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0031-coin-sums)

(defun bottom-up (target coins)
    (let ((ways (make-array (+ 1 target) :initial-element 0)))
    (incf (aref ways 0))
    (dolist (coin coins)
        (do ((amount coin (+ 1 amount))) ((= amount (+ 1 target)))
            (incf (aref ways amount) (aref ways (- amount coin)))))
    (aref ways target)))
(defun main ()
    (bottom-up 200 (list 1 2 5 10 20 50 100 200)))

(defun solve () (main))
