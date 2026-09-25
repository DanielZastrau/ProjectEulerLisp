(defpackage #:project-euler/problems/p0016-power-digit-sum
    (:nicknames #:p0016)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0016-power-digit-sum)

;    ______exponent    ______result    ______time    ______python-time
;              1000            1366           0ms                  0ms
;          1000 000                      27 417ms
(defun solve () (digitsum (expt 2 1000000)))