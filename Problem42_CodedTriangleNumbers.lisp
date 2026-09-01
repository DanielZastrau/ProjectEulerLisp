(defun triangle-number (n) (declare (type fixnum n)) (* 0.5 n (+ n 1)))
(defun triangle-numbers () (loop for n from 1 to 100 collect (triangle-number n)))
(defun parse-words-uiop (filepath)
    (let* ((raw (uiop:read-file-string filepath))  (tokens (uiop:split-string raw :separator '(#\,))))
    ;; Strip bounding quotation marks and whitespace
    (loop for token in tokens for trimmed = (string-trim '(#\" #\Space #\Newline #\Return) token)
        when (plusp (length trimmed)) collect trimmed)))

(defun main ()
    (let ((count 0)  (nums (triangle-numbers)))
    (loop for word in (parse-words-uiop "./problem_data/0042_words.txt") 
        do (let ((total 0)) 
            (loop for char across word do (setf total (+ total (- (char-code char) 64))))
            (if (member total nums :test #'=) (setf count (+ count 1)))))
    count))

(print "Began") (finish-output) (time (print (main)))