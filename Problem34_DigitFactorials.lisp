; because the factorial of factorial digitsum of 9999999 is less than (expt 10 7), we set the limit to
; (expt 10 7) since these numbers are not reachable by their factorial digitsum
(defun main-original ()
    (let ((limit (expt 10 7)) (s 0))
    (do ((i 10 (+ i 1))) ((= i limit) s) (if (= i (reduce #'+ (map 'list #'commons:factorial (commons:digits i)))) (setf s (+ s i)) ) ) ) )

(defun main () (declare (optimize (speed 3) (safety 0) (debug 0)))

  (let ((factorials (make-array 10 :element-type 'fixnum :initial-contents (loop for i of-type fixnum from 0 to 9 collect (commons:factorial i))))
        (limit 2540160)
        (total-sum 0))
    (declare (type (simple-array fixnum (10)) factorials) (type fixnum limit total-sum))

    (loop for i of-type fixnum from 10 below limit
        do (let ((sum 0)  (temp i)) (declare (type fixnum sum temp))
            ;; Unbox digit extraction directly into CPU registers
            (loop while (> temp 0) do (multiple-value-bind (q r) (truncate temp 10)
                (incf sum (aref factorials r))
                (setf temp q)))
                (when (= sum i) (incf total-sum i))))

    total-sum))

(print "Began") (finish-output) (time (print (main)))