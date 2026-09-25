(defpackage #:project-euler/problems/p0006-sum-square-difference
    (:nicknames #:p0006)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0006-sum-square-difference)

; limit    ________result    ________time    ________python-time
;  10^2        25 164 150             0ms                    0ms
;  10^3                               0ms                    0ms
;  10^6                              15ms                  143ms
;  10^9                          35 453ms              166 986ms

(defun main (limit)
    (let ((sumofsquares 0) (squareofsum 0))
        (do ((i 1 (+ i 1))) ((> i limit) (- (* squareofsum squareofsum) sumofsquares))
            (setf sumofsquares (+ sumofsquares (* i i)))
            (setf squareofsum (+ squareofsum i)))))

(defun solve () (main 1000000000))
