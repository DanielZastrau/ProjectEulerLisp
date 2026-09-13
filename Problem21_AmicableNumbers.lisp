(defun main ()
    (let ((divisors (make-array 10001
                        :initial-element 0
                        :element-type '(unsigned-byte 16)))
            (sum 0))
    ;; this is a sieving approach
    (do ((n 1 (+ n 1))) ((= 10000 n))
        (do ((nn (* 2 n) (+ nn n))) ((> nn 10000))
            (incf (aref divisors nn) n)))
    (do ((n 1 (+ n 1))) ((= 10000 n) sum)
        (let ((div-sum (aref divisors n)))
        (when (and (< div-sum 10000)
                    (not (= n div-sum))
                    (= n (aref divisors div-sum)))
            (incf sum n))))))

(defun execute () (print "Began") (terpri) (time (print (main))))