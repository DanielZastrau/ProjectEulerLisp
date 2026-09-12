(defparameter *week-days* #("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"))

(defun main ()
    (let ((year 1900) (month 1) (day 1) (week-day 1) (count 0))
    (do () ((= 2001 year) count)
        (incf week-day)
        (when (= 8 week-day) (setf week-day 1))
        (incf day)
        (cond
            ((and (> day 28) (= month 2))
                (cond
                    ((plusp (mod year 4))
                        (incf month) (setf day 1))
                    ((and (= 30 day) (or (zerop (mod year 400)) (and (plusp (mod year 400)) (zerop (mod year 4)))))
                        (incf month) (setf day 1))))
            ((and (> day 30) (member month '(4 6 9 11)))
                (incf month) (setf day 1))
            ((and (> day 31) (member month '(1 3 5 7 8 10 12)))
                (incf month) (setf day 1)))
        (when (= month 13) (incf year) (setf month 1))
        (when (and (>= year 1901) (= 7 week-day) (= 1 day)) (incf count)))
    count))

(defun execute () (print "Began") (terpri) (time (print (main))))