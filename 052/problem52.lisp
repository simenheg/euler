;; It can be seen that the number, 125874, and its double, 251748, contain
;; exactly the same digits, but in a different order.

;; Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
;; contain the same digits.

(defun same-digits-p (&rest numbers)
  (let ((l (mapcar (lambda (n) (sort (write-to-string n) #'char<)) numbers)))
    (every (lambda (n) (string= (first l) n)) l)))

(do ((i 1 (+ i 1)))
    ((same-digits-p (* i 2) (* i 3) (* i 4) (* i 5) (* i 6)) i)) ; => 142857
