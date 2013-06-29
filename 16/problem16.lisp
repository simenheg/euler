;; 2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

;; What is the sum of the digits of the number 2¹⁰⁰⁰?

(defun digit-sum (n)
  (loop for c across (write-to-string n)
        sum (parse-integer (string c))))

(digit-sum (expt 2 1000)) ; => 1366
