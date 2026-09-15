(defpackage :commons    ; defines the namespace
    (:use :cl)    ; makes the default namespace (default functions) available in the defined namespace
    (:export    #:palindrome-p
                #:prime-p
                #:factorial
                #:digits
                #:digitsum
                #:reverse-num
                #:eratosthenes
                #:pythagoreantriplet
                #:count-frequencies
                #:distinct-permutations))

(in-package :commons)    ; sets the active namespace

(declaim (inline prime-p palindrome-p reverse-num digits factorial))

(defun prime-p (n)
    (if (< n 2) (return-from prime-p nil))
    (loop for m from 2 to (+ 1 (isqrt n)) do
        (if (= 0 (mod n m)) (return-from prime-p nil))
    )
t)

(defun reverse-num (n)
    (let ((tmp n) (rev 0))
    (loop while (> tmp 0) do
        (multiple-value-bind (q r) (truncate tmp 10)
            (setf rev (+ (* rev 10) r) tmp q)))
    rev))

(defun palindrome-p (n rev) (= n rev))

(defun factorial (n)
    "n! = n * (n-1) * (n-2) * (n-3) * ..."
    (declare (type fixnum n))
    (do ((i 1 (+ i 1)) (acc 1 (* acc i))) ((> i n) acc)))

(defun digits (n)
    "Computes the digits of any integer."
    (let ((tmp n) (d '()))
    (loop while (> tmp 0) do
        (multiple-value-bind (q r) (truncate tmp 10)
            (setf tmp q)
            (push r d)))
    d))

(defun digitsum (n)
    "Computes the digitsum of any integer."
    (typecase n
        (fixnum
            (locally (declare (type fixnum n) (optimize (speed 3) (safety 0) (debug 0)))
                (do ((tmp (abs n)) (sum 0)) ((zerop tmp) sum)
                    (declare (type fixnum tmp sum))
                    (multiple-value-bind (q r) (truncate tmp 10) (declare (type fixnum q r))
                        (setf tmp q sum (the fixnum (+ sum r)))))))
        (integer
            (do ((tmp (abs n)) (sum 0)) ((zerop tmp) sum)
                (multiple-value-bind (q r) (truncate tmp 10)
                    (setf tmp q sum (+ sum r)))))))

(defun eratosthenes (limit) (declare (type (or null fixnum) limit))
    ; Calculates (* 5 (expt 10 8)) in under 3s.  The corresponding python implementation for 10**8 takes 4 seconds.
    ; Fails to calculate (* 6 (expt 10 8)) because of Lisps max array size, whereby the allocation (isprime (make-array size :element-type 'bit :initial-element 1)) fails
    ; Technically, primes up to (expt 10 64) can at least be checked, since we have the primes up to (expt 10 8) and the check for primality of n only requires
    ;        primes up to (sqrt n).  They can just not be returned in an array

    ; In the future, I want to add (pagenation / multiple lists for larger calculation)

    (let* ((num-odds (ash (+ 1 limit) -1))
            (isprime (make-array num-odds :element-type 'bit :initial-element 1))
            (sqrtlimit (isqrt limit)))
        (declare (type (simple-bit-vector *) isprime)  (type fixnum num-odds sqrtlimit limit))

        (setf (sbit isprime 0) 0)

        ;; Sieve odd numbers starting at 3
        (loop for n of-type fixnum from 3 to sqrtlimit by 2 for i of-type fixnum from 1
            when (= (sbit isprime i) 1)
            do (let ((start (ash (* n n) -1))  (step n))
                (declare (type fixnum start step))
                (loop for composite-idx of-type fixnum from start below num-odds by step
                    do (setf (sbit isprime composite-idx) 0))))

        (cons 2 (loop for index of-type fixnum from 1 below num-odds
            when (= (sbit isprime index) 1) collect (the fixnum (+ 1 (ash index 1)))))))

(defun pythagoreantriplet (m n)
    (declare (type fixnum m n))
    (if (> m n)
        (list (- (expt m 2) (expt n 2)) (* 2 m n) (+ (expt m 2) (expt n 2)))
        '("m has to be larger than n")))

(defun get-permutations (frequencies curr-perm len depth result)
    (if (= len depth)
        (cons curr-perm result)
        (dolist (cell frequencies result)
            (let ((val (car cell)) (count (cdr cell)))
            (when (plusp count)
                (decf (cdr cell))
                (setf result (get-permutations
                                frequencies
                                (cons val curr-perm)
                                len (+ 1 depth) result))
                (incf (cdr cell)))))))

(defun count-frequencies (l)
    (let ((frequencies '()))
    (dolist (x l frequencies)
        (let ((is-member (assoc x frequencies)))
        (if is-member
            (incf (cdr is-member))
            (setf frequencies (acons x 1 frequencies)))))))

(defun call-perm-fn (arg1 arg2)
    (get-permutations arg1 '() arg2 0 '()))

(defun distinct-permutations (l &key (mode 0) len)
    "get permutations of the list l
    args:   l       list    list of elements or alist of frequencies
            mode    int     is a list passed or an alist of its frequencies
            len     int     if mode=1 the len of the permutations to be outputted
    returns:    list
    
    mode 0 if a raw list is passed and frequencies have to be calculated
    mode 1 if the frequencies are passed, then the total sum of elements *len* needs to be passed
    
    this naturally computes the permutations in lexicographic (numeric) ascending order"
    (if (zerop mode)
        (call-perm-fn (count-frequencies l) (length l))
        (call-perm-fn l len)))