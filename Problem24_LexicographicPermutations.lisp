(eval-when (:compile-toplevel :load-toplevel :execute)
    (load "C:\\Users\\danie\\Documents\\projects\\ProjectEulerLisp\\commons.lisp"))

(defpackage :p024 (:use :cl :commons))
(in-package :p024)

(defun get-permutations (frequencies curr-n index len depth)
    (if (= len depth)
        (if (= (expt 10 6) index)
            (list -1 curr-n)
            (list (+ 1 index) 0))
        (progn 
            (dolist (cell frequencies)
                (let ((val (car cell)) (count (cdr cell)))
                (when (plusp count)
                    (decf (cdr cell))
                    (let* ((new-n (+ val (* 10 curr-n)))
                        (result (get-permutations frequencies new-n index len (+ 1 depth))))
                    ;; pipe the answer through once found
                    (when (= -1 (first result))
                        (return-from get-permutations result))
                    ;; otherwise set the incremented index
                    (setf index (first result)))
                    (incf (cdr cell)))))
            ;; return the updated index state if the target wasn't found in this branch
            (list index 0))))

(defun get-frequencies ()
    (let ((out '()))
    (do ((i 9 (- i 1))) ((minusp i) out)
        (push (cons i 1) out))))

(defun main () (second (get-permutations (get-frequencies) 0 1 10 0)))

(defun execute () (print "Began") (terpri) (time (print (main))))