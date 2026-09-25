(defpackage #:project-euler/problems/p0046-goldbachs-other-conjecture
    (:nicknames #:p0046)
    (:use #:cl #:project-euler/commons)
    (:export #:solve))
(in-package #:project-euler/problems/p0046-goldbachs-other-conjecture)

(declaim (inline expression))

(defun expression (prime j) (+ prime (* 2 (expt j 2))))

(defun goldbach-p (n primes)
    (let ((val 0))
    (dolist (prime primes)
        (if (> prime n) (return-from goldbach-p nil))
        (setf val (do ((j 1 (+ 1 j))) ((>= (expression prime j) n) j)))
        (if (= (expression prime val) n) (return t))
    nil)))

(defun main (limit)
    (let ((primes (eratosthenes limit)))
    (do ((i 3 (+ 2 i))) ((>= i limit))
        (if (and (not (prime-p i))
                 (not (goldbach-p i primes)))
            (return-from main i)))))

(defun solve () (main 10000))
