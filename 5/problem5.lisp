;; 2520 is the smallest number that can be divided by each of the numbers
;; from 1 to 10 without any remainder.

;; What is the smallest positive number that is evenly divisible by all of
;; the numbers from 1 to 20?

(loop for i from 20 by 20
      until (every (lambda (x) (= 0 (mod i x))) '(19 18 17 16 13 11 7))
      finally (return i))

;; => 232792560
