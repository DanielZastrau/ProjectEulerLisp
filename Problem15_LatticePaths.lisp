(defun main (grid-size)
    ;; we only need to know where the 1s go, because they determine the places of the 0s
    ;; i.e. out of 40 places how many ways can we choose 20? > binomial coefficient
    (/ (commons:factorial (* 2 grid-size)) (expt (commons:factorial grid-size) 2)))
    ; (let ((product 1))
    ; (do ((n 1 (+ n 1))) ((> n grid-size) product)
    ;     (setf product (* product (/ (+ grid-size n) n))))))


(defun execute () (print "Began") (terpri) (time (print (main 20))))