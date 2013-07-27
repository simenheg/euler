;; The first two consecutive numbers to have two distinct prime factors are:

;; 14 = 2 × 7
;; 15 = 3 × 5

;; The first three consecutive numbers to have three distinct prime factors
;; are:

;; 644 = 2² × 7 × 23
;; 645 = 3 × 5 × 43
;; 646 = 2 × 17 × 19.

;; Find the first four consecutive integers to have four distinct prime
;; factors. What is the first of these numbers?

(defun factor (n)
  "Return a list of prime factors of N."
  (when (< 1 n)
    (let ((max-d (isqrt n)))
      (loop for d = 2 then (if (evenp d) (+ d 1) (+ d 2))
            when (< max-d d) return (list n) ; N is prime
            when (= (mod n d) 0) return (cons d (factor (truncate n d)))))))

(defun distinct-prime-factors (n)
  "Return the number of distinct prime factors of N."
  (length (remove-duplicates (factor n))))

(defun consecutive-integers (goal &optional (n 2) (count 0))
  (if (= count goal)
      (loop for i from (- n goal) below n collect i)
      (if (= goal (distinct-prime-factors n))
          (consecutive-integers goal (+ n 1) (+ count 1))
          (consecutive-integers goal (+ n 1) 0))))

(first (consecutive-integers 4)) ; => 134043
