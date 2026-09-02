(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun main (limit) (declare (type fixnum limit))
    (let ((total-sum 0) (primes (commons:eratosthenes limit)))
        (declare (type fixnum total-sum) (type list primes))
        (loop for prime of-type fixnum in primes do (incf total-sum prime))
    total-sum) )

(print "Began") (finish-output) (time (print (main (* 2 (expt 10 6)))))