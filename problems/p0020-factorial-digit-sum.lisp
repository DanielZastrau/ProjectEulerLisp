(defpackage #:project-euler/problems/p0020-factorial-digit-sum
    (:nicknames #:p0020)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0020-factorial-digit-sum)

; ______n    ______result    ______time    ______python-time
;      10              27           0ms                   0ms
;     100             648           0ms                   0ms
;    1000                           7ms                  72ms
;   10000                         558ms              52 304ms
;  100000                      68 057ms         not evaluable

(defun solve () (digitsum (factorial 100)))