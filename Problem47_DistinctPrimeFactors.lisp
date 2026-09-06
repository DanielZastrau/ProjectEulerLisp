(defun main (amount)
    (let* ((limit 10000000) (prime-factors (make-array limit
                                            :initial-element 0
                                            :element-type '(unsigned-byte 8))))
        (declare (type (simple-array (unsigned-byte 8) (*)) prime-factors))
    (do ((n 2 (+ n 1))) ((= n limit)) 
        (if (zerop (aref prime-factors n))
            (do ((nn n (+ nn n))) ((>= nn limit))
                (incf (aref prime-factors nn)))))
    (do ((n 1000 (+ n 1)) (consec 0)) ((= n limit))
        (if (= (aref prime-factors n) amount)
            (incf consec)
            (setf consec 0))
        (if (= consec amount) (return-from main (- n (- amount 1)))))))

(defun execute () (print "Began") (finish-output) (time (print (main 5))))