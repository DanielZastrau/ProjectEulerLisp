(defun main ()
    (let ((mx 0) (num 0) ) (declare (type fixnum mx) (type integer num))
    (loop for a of-type fixnum from 1 below 100 do
        (loop for b of-type fixnum from 1 below 100 do
            (setf num (commons:digitsum (expt a b)))
            (if (> num mx) (setf mx num))))
    mx))

(print "Began") (finish-output) (time (print (main)))