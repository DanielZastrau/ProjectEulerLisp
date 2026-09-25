(defpackage #:project-euler/problems/p0049-prime-permutations
    (:nicknames #:p0049)
    (:use #:cl #:project-euler/commons)
    (:import-from #:alexandria #:map-permutations)
    (:export #:solve))
(in-package #:project-euler/problems/p0049-prime-permutations)

(defun arithmetic-progression (l)
    (let ((diff 0) (n1 0) (n2 0) (progressions '()))
    (loop for i below (length l) do
        (loop for j from (+ 1 i) below (length l) do
            (setf n1 (nth i l) n2 (nth j l))
            (setf diff (- n2 n1))
            (when (member (+ n2 diff) l) (push (list n1 n2 (+ n2 diff)) progressions))))
    (first progressions)))

(defun main () ()
    (let ((primes (eratosthenes (expt 10 4))) (perms '()) (iperm 0) (progrs '()) (out '()))
    (loop for prime in primes do
        (setf perms '())
        (map-permutations (lambda (perm)
            (setf iperm (parse-integer perm))
            (if (prime-p iperm) (push iperm perms))) (write-to-string prime) )
        (setf perms (remove-duplicates perms))
        (setf perms (remove-if-not #'prime-p perms))
        (setf perms (remove-if-not #'(lambda (x) (> x 1000)) perms))
        (setf perms (sort perms #'<))
        (setf progrs (arithmetic-progression perms))
        (when progrs (pushnew progrs out :test #'equal)))
    out))

(defun solve () (main))
