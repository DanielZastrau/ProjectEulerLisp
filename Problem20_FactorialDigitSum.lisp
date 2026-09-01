; ______n    ______result    ______time    ______python-time
;      10              27           0ms                   0ms
;     100             648           0ms                   0ms
;    1000                           7ms                  72ms
;   10000                         558ms              52 304ms
;  100000                      68 057ms         not evaluable

(load "commons.lisp")

(defun main () (print 'Began) (finish-output) (time (print (commons:digitsum (commons:factorial 100)))))

(main)