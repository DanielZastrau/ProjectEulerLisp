(defun base2 (n) (declare (type fixnum n))
    (if (zerop n) 0 (loop with temp = n with factor = 1 with result = 0 while (> temp 0)
        do (multiple-value-bind (q r) (floor temp 2)
            (incf result (* r factor)) (setf factor (* factor 10) temp q))
        finally (return result))))

(defun sumup (limit) (declare (type fixnum limit))
    (let ((total 0)) (declare (type fixnum total))
    (do ((n 1 (+ n 1))) ((= n limit) total)
        (let ((s (write-to-string n)) (ss (write-to-string (base2 n))))
        (if (and (equal s (reverse s)) (equal ss (reverse ss))) (setf total (+ total n)) )))))

(defun main () (print "Began") (finish-output) (time (print (sumup (expt 10 6)))))

(main)