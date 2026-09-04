(ql:quickload :alexandria)

(defun arithmetic-progression (l)
    (let ((diff 0) (n1 0) (n2 0) (progressions '()))
    (loop for i below (length l) do
        (loop for j from (+ 1 i) below (length l) do
            (setf n1 (nth i l) n2 (nth j l))
            (setf diff (- n2 n1))
            (if (member (+ n2 diff) l) (push (list n1 n2 (+ n2 diff)) progressions))))
    (first progressions)))

(defun main () ()
    (let ((primes (commons:eratosthenes (expt 10 4))) (perms '()) (iperm 0) (progrs '()) (out '()))
    (loop for prime in primes do
        (setf perms '())
        (alexandria:map-permutations (lambda (perm)
            (setf iperm (parse-integer perm))
            (if (commons:isprime iperm) (push iperm perms))) (write-to-string prime) )
        (setf perms (remove-duplicates perms))
        (setf perms (remove-if-not #'commons:isprime perms))
        (setf perms (remove-if-not #'(lambda (x) (> x 1000)) perms))
        (setf perms (sort perms #'<))
        (setf progrs (arithmetic-progression perms))
        (if progrs (setf out (push progrs out))))
    (print (remove-duplicates out :test #'equal))))

(print "Began") (finish-output) (time (print (main)))