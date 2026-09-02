(defun main (limit) (declare (type fixnum limit))
    (let ((primes (commons:eratosthenes limit))  (powers '())) (declare (type list primes))
        (loop for prime in primes do (push (floor (/ (log limit 10) (log prime 10))) powers) )
        
        (let ((n 1)) (declare (type fixnum n))
            (loop for prime in primes for power in (reverse powers) do (setf n (* n (expt prime power))) )
            n) ) )

(print "Began") (finish-output) (time (print (main 20)))