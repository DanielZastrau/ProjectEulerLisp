(defpackage #:project-euler/problems/p0012-highly-divisible-triangle-numbers
    (:nicknames #:p0012)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0012-highly-divisible-triangle-numbers)

(defun divisors (n)
    (let ((count 0))
    (do ((j 1 (+ 1 j))) ((>= j (isqrt n)) count)
        (when (zerop (mod n j)) (incf count 2)))
    (when (zerop (mod (isqrt n) 1)) (incf count))))

(defun main ()
    (let ((n 0) (divs 0))
    (do ((i 1 (+ 1 i))) ((= i (expt 10 10)))
        (setf n (+ n i) divs (divisors n))
        (when (> divs 500) (return-from main n)))))

(defun solve () (main))
