(defun add-digits (x mask)
    "add the digits of x to the bit-mask, return nil on a zero or repeated digit"
    (loop while (plusp x)
        do (multiple-value-bind (q d) (floor x 10)
            ;; when the digit is zero or the bit of the mask is already positive
            (when (or (zerop d) (logbitp d mask))
                (return-from add-digits nil))
            ;; ash 1 d,  shifts the number 1 left by d bits, i.e. marking the digit d as seen
            (setf mask (logior mask (ash 1 d)) x q)))
    mask)

(defun pandigital-product-p (n)
    (let ((base (add-digits n 0)))
    (when base (loop for i from 2 to (isqrt n)
        ;; stops at the first instance which returns t
        thereis (and
            (zerop (mod n i))
            (let ((m (add-digits i base)))

                ;; comparison of bitmasks
                (and m (eql (add-digits (floor n i) m) #b1111111110))))))))

(defun main ()
    (loop for n from 1234 to 9876
        when (pandigital-product-p n) sum n))

(defun execute () (print "Began") (terpri) (time (print (main))))