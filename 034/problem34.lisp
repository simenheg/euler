;; 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

;; Find the sum of all numbers which are equal to the sum of the factorial
;; of their digits.

;; Note: as 1! = 1 and 2! = 2 are not sums they are not included.

(defparameter factorials #(1 1 2 6 24 120 720 5040 40320 362880))

(defun fac-digit-sum (n)
  (loop for c across (write-to-string n)
        sum (aref factorials (parse-integer (string c)))))

(loop for n from 3 to 1e6 when (= n (fac-digit-sum n)) sum n) ; => 40730
