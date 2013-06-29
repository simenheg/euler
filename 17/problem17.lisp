;; If the numbers 1 to 5 are written out in words: one, two, three, four,
;; five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

;; If all the numbers from 1 to 1000 (one thousand) inclusive were written
;; out in words, how many letters would be used?

(defun number-of-letters (n)
  (+ (if (and (> n 100) (> (mod n 100) 0)) 3 0) ; compensate missing 'and'
     (count-if #'alpha-char-p (format nil "~r" n))))

(loop for i from 1 to 1000 sum (number-of-letters i)) ; => 21124
