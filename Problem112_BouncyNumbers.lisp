(defun increasing-p (digits)
    (let ((last-digit -1))
    (dolist (digit digits)
        (if (< digit last-digit)
            (return-from increasing-p nil)
            (setf last-digit digit)))
    t))

(defun decreasing-p (digits)
    (let ((last-digit 10))
    (dolist (digit digits)
        (if (> digit last-digit)
            (return-from decreasing-p nil)
            (setf last-digit digit)))
    t))

(defun main ()
    (let ((count 0))
    (do ((n 1 (+ n 1))) ((> n (expt 10 7)) count)
        (let ((digits (commons:digits n)))
        (if (and (not (increasing-p digits)) (not (decreasing-p digits)))
            (incf count))
        
        ;; we want the fraction count / n to be equal to 0.99 = 99 / 100.
        ;; CL stores fractions as rationals p / q reduces as far as possible,
        ;;    which causes 0.99 = 99/100 to fail because of binary representation limits
        ;; thus, we use the cross multiplication comparison
        (if (= (* 100 count) (* 99 n)) (return-from main n))))))

(defun execute () (print "Began") (finish-output) (time (print (main))))