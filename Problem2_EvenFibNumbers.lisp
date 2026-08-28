;____limit    ____result    ____time    ____python-time
;  4*10**6     4 613 732         0ms                0ms
;    10**9                       0ms                0ms
;   10**12                       0ms                0ms
;   10**15                       0ms                0ms
;   10**20                       0ms                0ms
;   10**30                       0ms                0ms
;   10**40                       0ms                0ms
;   10**60                       0ms                0ms
;  10**100                       0ms                0ms
;  10**200                       0ms                0ms

(defun fibnumbers (limit)
    (let ((x 1) (y 1) (z 0) (total 0))
        (do () ((> (+ x y) limit) total)
            (psetf x y y (+ x y))
            (cond ((= (mod z 2) 0) (setf total (+ total z)))))))

(time (print (fibnumbers (expt 10 200))))