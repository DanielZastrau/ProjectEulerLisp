; limit                    result            time    python-time
; 1000                    233 168         0.000ms          0.2ms
; 10^6            233 333 166 668         0.019ms        117.3ms
; 10^9    233 333 333 166 666 668    15 227.000ms    121 259.0ms

(defun sum35 (limit)
    (let ((total 0))
        (do ((i 1 (+ i 1))) ((= i limit) total)
            (cond   ((= (mod i 3) 0) (setf total (+ total i)))
                    ((= (mod i 5) 0) (setf total (+ total i)))))))

(time (princ (sum35 1000000000)))