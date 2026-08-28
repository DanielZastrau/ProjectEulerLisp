(defpackage :commons    ; defines the namespace
    (:use :cl)    ; makes the default namespace (default functions) available in the defined namespace
    (:export :digitsum))

(in-package :commons)    ; sets the active namespace

(defun digitsum (n) (do ((temp n (floor temp 10)) (sum 0 (+ sum (mod temp 10)))) ((zerop temp) sum)))