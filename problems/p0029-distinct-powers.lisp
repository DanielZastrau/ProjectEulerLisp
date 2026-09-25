(defpackage #:project-euler/problems/p0029-distinct-powers
    (:nicknames #:p0029)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0029-distinct-powers)

(defun main ()
    (let ((nums (make-hash-table :test 'eql :size 10000))) 
    (do ((a 2 (+ 1 a))) ((= 101 a))
        (do ((b 2 (+ 1 b))) ((= 101 b))
            (setf (gethash (expt a b) nums) t)))
    (hash-table-count nums)))

(defun solve () (main))
