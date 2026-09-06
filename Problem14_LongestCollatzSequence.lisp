(defun next-collatz (n)
    (if (zerop (mod n 2))
        (ash n -1)
        (+ 1 (* 3 n))))

(defun collatz-length (n sequence-lengths)
    (let ((len 1) (num n))
    (loop while (not (= num 1)) do
        (incf len 1)
        (setf num (next-collatz num))
        (if (< num n) (return-from collatz-length (+ len (aref sequence-lengths num)))))
    len))

(defun main (limit)
    (let ((mx 0) (mx-e 0) (l 0) (sequence-lengths (make-array limit :initial-element 1)))
    (loop for n from 2 below limit do
        (setf l (collatz-length n sequence-lengths))
        (setf (aref sequence-lengths n) l)
        (if (> l mx) (setf mx l mx-e n)))
    mx-e))

(defun executer () (print "Began") (finish-output) (time (print (main (expt 10 6)))))