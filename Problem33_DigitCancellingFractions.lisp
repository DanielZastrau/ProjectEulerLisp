(defun main ()
    (let ((numbers '()) (total-numerator 1) (total-denominator 1) (div 1)) (declare (type list numbers) (type fixnum total-numerator total-denominator div))
    (loop for numerator of-type fixnum from 10 below 100 do
        (loop for denominator of-type fixnum from (+ numerator 1) below 100 do 
            (if (not (and (= 0 (mod numerator 10)) (= 0 (mod denominator 10))))
                (let ((digits-numerator (commons:digits numerator)) (digits-denominator (commons:digits denominator))) (declare (type list digits-numerator digits-denominator))
                (if (loop for digit of-type fixnum in digits-numerator do
                    (if (member digit digits-denominator) (progn (setf digits-numerator (remove digit digits-numerator :count 1))
                                                                 (setf digits-denominator (remove digit digits-denominator :count 1))
                                                                 (return t))))
                    (if (and    (plusp (first digits-denominator))
                                (= (/ numerator denominator) (/ (first digits-numerator) (first digits-denominator))))
                        (push `(,numerator ,denominator) numbers)))))))
    (print numbers)
    (loop for tuple in numbers do
        (setf total-numerator (* total-numerator (first tuple)))
        (setf total-denominator (* total-denominator (second tuple))))
    (setf div (gcd total-numerator total-denominator))
    (loop while (> div 1) do
        (setf total-numerator (truncate total-numerator div) total-denominator (truncate total-denominator div))
        (setf div (gcd total-numerator total-denominator)))
    total-denominator ))

(print "Began") (finish-output) (time (print (main)))