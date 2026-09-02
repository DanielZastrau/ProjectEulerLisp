(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun main ()
    (let ((p 0) (mx 0) (total 0)) (declare (type fixnum p mx total))
    (loop for perim of-type fixnum from 1 to 1000 do
        (setf total 0)
        (loop for a of-type fixnum from 1 to perim do 
            (loop for b of-type fixnum from 1 to (- perim a) do
                (if (= (expt (- perim a b) 2) (+ (expt a 2) (expt b 2)) ) (incf total 1))))
        (if (> total mx) (setf mx total p perim)))
    p))

(print "Began") (finish-output) (time (print (main)))