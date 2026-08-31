(load "commons.lisp")

(defun main () (print "Began") (finish-output) (time (print (nth 10001 (commons:eratosthenes (expt 10 8))))))

(main)