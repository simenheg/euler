;; We shall say that an n-digit number is pandigital if it makes use of all
;; the digits 1 to n exactly once; for example, the 5-digit number, 15234,
;; is 1 through 5 pandigital.

;; The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
;; multiplicand, multiplier, and product is 1 through 9 pandigital.

;; Find the sum of all products whose multiplicand/multiplier/product
;; identity can be written as a 1 through 9 pandigital.

;; HINT: Some products can be obtained in more than one way so be sure to
;; only include it once in your sum.

(defun numbers-to-string (&rest numbers)
  (apply #'concatenate 'string (mapcar #'write-to-string numbers)))

(defun pandigital-p (a b c)
  (string= "123456789" (sort (numbers-to-string a b c) #'char<)))

(let ((found '()))
  (loop for a from 1 to 50 do
    (loop for b from 1 to 2000
          when (pandigital-p a b (* a b))
          do (pushnew (* a b) found)))
  (reduce #'+ found)) ; => 45228
