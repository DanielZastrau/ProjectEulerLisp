(defun main () () (do ((a 1 b) (b 1 (+ a b)) (index 2 (+ index 1))) ((> b (expt 10 999)) index)))

(defun execute () (print "Began") (finish-output) (time (print (main))))