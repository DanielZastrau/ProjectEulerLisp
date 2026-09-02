(declaim (optimize (speed 3) (safety 0) (debug 0)))

(defun parse-words-uiop (filepath) (declare (type string filepath))
    (let* ((raw (uiop:read-file-string filepath))  (tokens (uiop:split-string raw :separator '(#\,))))
    (declare (type list tokens))
    ;; Strip bounding quotation marks and whitespace
    (loop for token of-type simple-string in tokens for trimmed = (string-trim '(#\" #\Space #\Newline #\Return) token)
        when (plusp (length trimmed)) collect trimmed)))

(defun main ()
    (let ((words (sort (parse-words-uiop "./problem_data/0022_names.txt") #'sb-unicode:unicode<)) (total 0)) (declare (type list words) (type fixnum total))
    (loop for word of-type simple-string in words  for i of-type fixnum from 1 do
        (let ((word-total 0)) (declare (type (integer 0 #.(expt 10 12)) word-total))
        (loop for char across word do (incf word-total (- (char-code char) 64)))
        (incf total (the fixnum (* word-total i)))))
    total))

(print "Began") (finish-output) (time (print (main)))