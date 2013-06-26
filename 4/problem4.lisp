;; A palindromic number reads the same both ways. The largest palindrome
;; made from the product of two 2-digit numbers is 9009 = 91 × 99.

;; Find the largest palindrome made from the product of two 3-digit numbers.

(loop for x from 100 below 1000 maximize
  (loop for y from 100 below 1000 maximize
    (let ((product (write-to-string (* x y))))
      (if (string= product (reverse product)) (* x y) 0))))

;; => 906609
