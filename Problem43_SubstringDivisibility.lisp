(ql:quickload :alexandria)

(defun list-to-num (l) (declare (type list l))
    (let ((total 0)) (declare (type fixnum total))
    (loop for i of-type fixnum from 0 to 9 do
        (incf total (* (expt 10 (- 9 i)) (nth i l))))
    total))

(defun test (l start-index div) (declare (type fixnum start-index div) (type list l))
    (let* ( (n1 (* 100 (nth start-index l)))
            (n2 (* 10 (nth (+ start-index 1) l)))
            (n3 (* 1 (nth (+ start-index 2) l)))
            (n (+ n1 n2 n3))) (declare (type fixnum n1 n2 n3 n))
    (zerop (mod n div))))

(defun has-special-property (d) (declare (type list d))
    (and (test d 1 2) (test d 2 3) (test d 3 5) (test d 4 7) (test d 5 11) (test d 6 13) (test d 7 17)))

(defun main ()
    (let ((sum 0)) (declare (type fixnum sum))
    (alexandria:map-permutations (lambda (perm)
        (if (and (not (zerop (first perm)))
                 (has-special-property perm))
            (incf sum (list-to-num perm))))
        '(0 1 2 3 4 5 6 7 8 9))
    sum))

(print "Began") (finish-output) (time (print (main)))