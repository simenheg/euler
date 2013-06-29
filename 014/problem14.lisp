;; The following iterative sequence is defined for the set of positive
;; integers:

;; n → n/2 (n is even)
;; n → 3n + 1 (n is odd)

;; Using the rule above and starting with 13, we generate the following
;; sequence:

;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

;; It can be seen that this sequence (starting at 13 and finishing at 1)
;; contains 10 terms. Although it has not been proved yet (Collatz Problem),
;; it is thought that all starting numbers finish at 1.

;; Which starting number, under one million, produces the longest chain?

(defun chain-length (n &optional (length 1))
  (if (= n 1)
      length
      (chain-length (if (evenp n) (/ n 2) (1+ (* 3 n))) (1+ length))))

(let ((max-length 0)
      (max-number 0))
  (loop for i from 1 below 1e6 do
    (let ((candidate-length (chain-length i)))
      (when (< max-length candidate-length)
        (setf max-length candidate-length)
        (setf max-number i))))
  max-number)

;; => 837799
