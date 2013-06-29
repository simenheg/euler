;; A unit fraction contains 1 in the numerator. The decimal representation
;; of the unit fractions with denominators 2 to 10 are given:

;;     1/2	= 	0.5
;;     1/3	= 	0.(3)
;;     1/4	= 	0.25
;;     1/5	= 	0.2
;;     1/6	= 	0.1(6)
;;     1/7	= 	0.(142857)
;;     1/8	= 	0.125
;;     1/9	= 	0.(1)
;;     1/10	= 	0.1

;; Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can
;; be seen that 1/7 has a 6-digit recurring cycle.

;; Find the value of d < 1000 for which 1/d contains the longest recurring
;; cycle in its decimal fraction part.

(defun unit-fraction-period (d)
  (do ((n 1 (* 10 (- n (* d (truncate n d)))))
       (history '()))
      ((member n history) (- (length history) 1
                             (position n (cdr (reverse history)))))
    (push n history)))

(let ((maxd 1)
      (max 0))
  (loop for d from 2 below 1000 do
    (let ((candidate (unit-fraction-period d)))
      (when (> candidate max)
        (setf max candidate)
        (setf maxd d))))
  maxd) ; => 983
