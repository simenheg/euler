;; n! means n × (n − 1) × ... × 3 × 2 × 1

;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;; and the sum of the digits in the number 10! is
;; 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

;; Find the sum of the digits in the number 100!

(defun factorial (n)
  (reduce #'* (loop for i from 2 to n collect i)))

(defun digit-sum (n)
  (loop for c across (write-to-string n)
        sum (parse-integer (string c))))

(digit-sum (factorial 100)) ; => 648
