(defpackage #:project-euler/runner
    (:nicknames #:euler)
    (:use #:cl)
    (:export #:run #:problem-system))

(in-package #:project-euler/runner)

(defun problem-system (n)
    "Name of the ASDF system solving problem N, found via the file prefix pNNNN-."
    (let* ((prefix (format nil "p~4,'0d-" n))
            (dir (asdf:system-relative-pathname "project-euler" "problems/"))
            (file (find-if (lambda (f) (uiop:string-prefix-p prefix (pathname-name f)))
                           (uiop:directory-files dir "*.lisp"))))
    (unless file (error "No solution file for problem ~D in ~A" n dir))
    (format nil "project-euler/problems/~A" (pathname-name file))))

(defun run (n)
    "Loads (compiling if needed) the solution of problem N and times its SOLVE function."
    (let ((system (problem-system n)))
    (asdf:load-system system)
    (print "Began") (finish-output)
    (time (print (funcall (find-symbol "SOLVE" (string-upcase system)))))))
