; because (* 6 (expt 9 5)) => 354294 we set the limit to (* 4 (expt 10 5))
; because no 6-digit number can past that limit can then equal is sum of powers
(declaim (inline sum-digits-fifth-powers) (optimize (speed 3) (safety 0) (debug 0)))

(defvar fifth-powers
    (make-array 10  :element-type 'fixnum
                    :initial-contents (loop for i from 0 below 10 collect (expt i 5))))

(defun sum-digits-fifth-powers (n) (declare (optimize (speed 3) (safety 0)) (type fixnum n))
    (let ((sum 0)  (tmp n)) (declare (type fixnum sum tmp))
    (loop while (> tmp 0) do (multiple-value-bind (q r) (truncate tmp 10)
        (incf sum (aref fifth-powers r))
        (setf tmp q)))
    sum))

(defun main () ()
    (let ((limit (* 4 (expt 10 5))) (total-sum 0)) (declare (type fixnum limit))
        (loop for n from 10 below limit
            do (let ((digit-sum (sum-digits-fifth-powers n))) (declare (type fixnum digit-sum))
                (if (= n digit-sum) (incf total-sum n) ) ) )
    total-sum) )

(print "Began") (finish-output) (time (print (main)))