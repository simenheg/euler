;; There are exactly ten ways of selecting three from five, 12345:

;; 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

;; In combinatorics, we use the notation, ⁵C₃ = 10.

;; In general,

;;          n!
;; ⁿCᵣ = ——————––, where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
;;       r!(n−r)!     

;; It is not until n = 23, that a value exceeds one-million:
;; ²³C₁₀ = 1144066.

;; How many, not necessarily distinct, values of ⁿCᵣ, for 1 ≤ n ≤ 100, are
;; greater than one-million?

(defun fac (n)
  (reduce #'* (loop for i from 1 to n collect i)))

(defun ncr (n r)
  (/ (fac n) (* (fac r) (fac (- n r)))))

(loop for n from 1 to 100 sum
  (loop for r from 1 to n count (< 1000000 (ncr n r)))) ; => 4075
