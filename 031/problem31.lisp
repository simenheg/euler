;; In England the currency is made up of pound, £, and pence, p, and there
;; are eight coins in general circulation:

;;     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

;; It is possible to make £2 in the following way:

;;     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

;; How many different ways can £2 be made using any number of coins?

(defun ways (amount coins)
  (cond ((null coins) 0)
        ((zerop amount) 1)
        (t (+ (ways amount (rest coins))
              (if (<= (first coins) amount)
                  (ways (- amount (first coins)) coins)
                  0)))))

(ways 200 '(200 100 50 20 10 5 2 1)) ; => 73682
