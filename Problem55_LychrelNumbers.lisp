(defun islychrel-p (n)
    (let ((sum n) (rev (commons:reverse-num n)))
    (dotimes (iteration 50)
        (incf sum rev)
        (setf rev (commons:reverse-num sum))
        (if (commons:palindrome-p sum rev) (return-from islychrel-p nil)))
    t))

(defun main ()
    (let ((count 0))
    (dotimes (n 10000 count)
        (if (islychrel-p n) (incf count)))))

(defun execute () (print "Began") (finish-output) (time (print (main))))