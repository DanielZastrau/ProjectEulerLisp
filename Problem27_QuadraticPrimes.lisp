(declaim (inline end-of-prime-sequence quadratic))

(defun nums (limit) (loop for n from (* -1 limit) to limit collect n))

(defun quadratic (b c n) (+ (* n n) (* b n) c))

(defun end-of-prime-sequence (b c) (do ((x 0 (+ x 1))) ((not (commons:isprime (quadratic b c x))) x)))

(defun main (limit)
    (let ((primes (commons:eratosthenes limit)) (ns (nums limit)) (x 0) (mx-n 0) (mx-b 0) (mx-c 0))
    (dolist (b ns (* mx-b mx-c))
        (dolist (prime primes)
            (setf x (end-of-prime-sequence b prime))
            (if (> x mx-n) (setf mx-n x mx-b b mx-c prime))))
    (* mx-b mx-c)))

(defun execute () (print "Began") (finish-output) (time (print (main 1000))))