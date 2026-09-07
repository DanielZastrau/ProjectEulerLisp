(defun parse-integers (filepath)
    (let* ((raw (uiop:read-file-string filepath))
            (tokens (uiop:split-string raw :separator '(#\,))))
    (map 'vector #'parse-integer tokens)))

(defun valid-ascii-p (code)
    (or (and (>= code 32) (<= code 126))
        (= code 10)    ;  newline
        (= code 13)    ;  carriage return
        (= code 9)))   ;  horizontal tab

(defun main () ()
    (let* ((integers (parse-integers "./problem_data/0059_cipher.txt"))
            (len (length integers))
            (start (char-code #\a))
            (end (char-code #\z))
            (overlay (make-array len :initial-element 0 :element-type '(unsigned-byte 8)))
            (text (make-string len))
            (values (make-array 3 :initial-element 0 :element-type '(unsigned-byte 8)))
            (valid t))    
    (loop for char1 from start to end do
        (setf (aref values 0) char1) 
        (loop for char2 from start to end do
            (setf (aref values 1) char2)
            (loop for char3 from start to end do
                (setf (aref values 2) char3)
                (setf valid t)
                (dotimes (i len)
                    (let* ((key-char (aref values (mod i 3)))
                            (cipher-char (aref integers i))
                            (decrypted (logxor key-char cipher-char)))
                        (if (not (valid-ascii-p decrypted))
                            (progn (setf valid nil) (return))
                            (progn
                                (setf (aref overlay i) decrypted)
                                (setf (char text i) (code-char decrypted))))))
                (when (and valid (search "extract" text))
                    (return-from main (reduce #'+ overlay))))))))

(defun executer () (print "Began") (finish-output) (time (print (main))))