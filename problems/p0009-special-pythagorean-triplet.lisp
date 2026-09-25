(defpackage #:project-euler/problems/p0009-special-pythagorean-triplet
    (:nicknames #:p0009)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0009-special-pythagorean-triplet)

;  ______target    ______result    ______time
;          1000      31 875 000           0ms

(defun triplet-product (target)
    (let ((total 0))
        (do ((m 2 (+ m 1))) ((> m (sqrt target)) total)
            (do ((n 1 (+ n 1))) ((> n m))
                (let ((a (- (expt m 2) (expt n 2)))
                        (b (* 2 m n))
                        (c (+ (expt m 2) (expt n 2))))
                    (cond ((= target (+ a b c)) (setf total (* a b c)))))))))

(defun solve () (triplet-product 1000))