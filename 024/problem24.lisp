;; A permutation is an ordered arrangement of objects. For example, 3124 is
;; one possible permutation of the digits 1, 2, 3 and 4. If all of the
;; permutations are listed numerically or alphabetically, we call it
;; lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

;; 012   021   102   120   201   210

;; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3,
;; 4, 5, 6, 7, 8 and 9?

(defun fact (n)
  (reduce #'* (loop for i from 1 to n collect i)))

(defun nth-permutation (list n)
  (if (= n 0)
      list
      (multiple-value-bind (i rest) (truncate n (fact (- (length list) 1)))
        (let ((next (nth i list)))
          (cons next (nth-permutation (remove next list) rest))))))

(dolist (digit (nth-permutation '(0 1 2 3 4 5 6 7 8 9) (- 1000000 1)))
  (princ digit))

;; => 2783915460
