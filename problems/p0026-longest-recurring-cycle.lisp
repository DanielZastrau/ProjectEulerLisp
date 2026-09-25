(defpackage #:project-euler/problems/p0026-longest-recurring-cycle
    (:nicknames #:p0026)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0026-longest-recurring-cycle)

(defun cycle-length (n remainders)
    (let ((r 1))
    (dotimes (i n)
        (let ((x (mod r n)))
        (do ((index 0 (+ 1 index))) ((= index i))
            (when (= x (aref remainders index))
                (return-from cycle-length (- i index))))
        (setf (aref remainders i) x)
        (setf r (* 10 x))))))

(defun main (limit)
    (let ((mx 0)
        (remainders (make-array 1000
                        :initial-element 0
                        :element-type '(unsigned-byte 16))))
    (do ((n 3 (+ n 1))) ((= n limit) mx)
        (let ((len (cycle-length n remainders)))
        (when (< mx len)
            (setf mx n))))
    mx))

(defun solve () (main 1000))
