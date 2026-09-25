(defpackage #:project-euler/problems/p0055-lychrel-numbers
    (:nicknames #:p0055)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0055-lychrel-numbers)

(defun islychrel-p (n)
    (let ((sum n) (rev (reverse-num n)))
    (dotimes (iteration 50)
        (incf sum rev)
        (setf rev (reverse-num sum))
        (if (palindrome-p sum rev) (return-from islychrel-p nil)))
    t))

(defun main ()
    (let ((count 0))
    (dotimes (n 10000 count)
        (if (islychrel-p n) (incf count)))))

(defun solve () (main))
