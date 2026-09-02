(declaim (inline hexagonal-number pentagonal-inverse) (optimize (speed 3) (safety 0) (debug 0)))

(defun is-pentagonal (x) (declare (type (integer 0 1000000000000) x))
    (let* ((inner (+ 1 (* 24 x))) (sq (isqrt inner))) (declare (type fixnum inner sq))
        (and (= (* sq sq) inner) (zerop (mod (+ 1 sq) 6)))))

(defun hexagonal-number (n) (declare (type (integer 0 100000) n)) (* n (- (* 2 n) 1)))  ; n (2n - 1)

(defun main ()
    (let ((hex 0)) (declare (type fixnum hex))
        (loop for n of-type fixnum from 144 do
            (setf hex (hexagonal-number n))
            (if (is-pentagonal hex) (return hex)))))

(print "Began") (finish-output) (time (print (main)))