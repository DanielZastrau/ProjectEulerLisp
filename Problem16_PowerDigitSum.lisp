;    ______exponent    ______result    ______time    ______python-time
;              1000            1366           0ms                  0ms
;          1000 000                      27 417ms
(load "commons.lisp")

(defun main () (print 'Began) (finish-output) (time (princ (commons:digitsum (expt 2 1000000)))))

(main)