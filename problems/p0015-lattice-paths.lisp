(defpackage #:project-euler/problems/p0015-lattice-paths
    (:nicknames #:p0015)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0015-lattice-paths)

(defun main (grid-size)
    ;; we only need to know where the 1s go, because they determine the places of the 0s
    ;; i.e. out of 40 places how many ways can we choose 20? > binomial coefficient
    (/ (factorial (* 2 grid-size)) (expt (factorial grid-size) 2)))
    ; (let ((product 1))
    ; (do ((n 1 (+ n 1))) ((> n grid-size) product)
    ;     (setf product (* product (/ (+ grid-size n) n))))))


(defun solve () (main 20))
