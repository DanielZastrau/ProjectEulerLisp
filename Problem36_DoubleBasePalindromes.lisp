(defun base2 (n)
    ; in the test on n up to 10**8, this took ~74s compared to
    ; (parse-integer (format nil "~b" n)), which took 87s
    ; incr > increment form > (incf var increment)
    (declare (type fixnum n))
    (if (zerop n) 0 (loop with temp = n with factor = 1 with result = 0 while (> temp 0)
        do (multiple-value-bind (q r) (floor temp 2)
            (incf result (* r factor)) (setf factor (* factor 10) temp q))
        finally (return result))))

(defun sumup (limit)
    ; (if (cond) (true) (false))
    (declare (type fixnum limit))
    (let ((total 0))
    (do ((n 1 (+ n 1))) ((= n limit) total)
        (if (and (commons:palindrome n) (commons:palindrome (base2 n))) (setf total (+ total n)) ))))

(defun main () (print "Began") (finish-output) (time (print (sumup (expt 10 6)))))

(main)