(defun eratosthenes (limit)
    ; Calculates (* 5 (expt 10 8)) in under 3s.  The corresponding python implementation for 10**8 takes 4 seconds.
    ; Fails to calculate (* 6 (expt 10 8)) because of Lisps max array size, whereby the allocation (isprime (make-array size :element-type 'bit :initial-element 1)) fails
    ; Technically, primes up to (expt 10 64) can at least be checked, since we have the primes up to (expt 10 8) and the check for primality of n only requires
    ;        primes up to (sqrt n).  They can just not be returned in an array

    ; In the future, I want to add (pagenation / multiple lists for larger calculation)

    (declare (type (or null fixnum) limit)  (optimize (speed 3) (safety 0) (debug 0)))
    (let* ((num-odds (ash (+ 1 limit) -1))  (isprime (make-array num-odds :element-type 'bit :initial-element 1))  (sqrtlimit (isqrt limit)))
        (declare (type (simple-bit-vector *) isprime)  (type fixnum num-odds sqrtlimit limit))

        (setf (sbit isprime 0) 0)

        ;; Sieve odd numbers starting at 3
        (loop for n of-type fixnum from 3 to sqrtlimit by 2 for i of-type fixnum from 1
            when (= (sbit isprime i) 1)
            do (let ((start (ash (* n n) -1))  (step n))
                (declare (type fixnum start step))
                (loop for composite-idx of-type fixnum from start below num-odds by step
                    do (setf (sbit isprime composite-idx) 0))))

        (cons 2 (loop for index of-type fixnum from 1 below num-odds
            when (= (sbit isprime index) 1) collect (the fixnum (+ 1 (ash index 1)))))))
        

(defun main () (print "Began") (finish-output) (time (print (nth 10001 (eratosthenes (expt 10 8))))))

(main)