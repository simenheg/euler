;; A googol (10¹⁰⁰) is a massive number: one followed by one-hundred zeros;
;; 100¹⁰⁰ is almost unimaginably large: one followed by two-hundred
;; zeros. Despite their size, the sum of the digits in each number is only
;; 1.

;; Considering natural numbers of the form, aᵇ, where a, b < 100, what is
;; the maximum digital sum?

(defun digit-sum (n)
  (loop for c across (write-to-string n)
        sum (parse-integer (string c))))

(loop for a below 100 maximize
  (loop for b below 100 maximize
    (digit-sum (expt a b)))) ; => 972

