;; Find the sum of the digits in the number 100!

(defun factorial (n)
  (reduce #'* (loop for i from 2 to n collect i)))

(defun digit-sum (n)
  (loop for c across (write-to-string n)
        sum (parse-integer (string c))))

(digit-sum (factorial 100)) ; => 648
