;; The fraction 49/98 is a curious fraction, as an inexperienced
;; mathematician in attempting to simplify it may incorrectly believe that
;; 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

;; We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

;; There are exactly four non-trivial examples of this type of fraction,
;; less than one in value, and containing two digits in the numerator and
;; denominator.

;; If the product of these four fractions is given in its lowest common
;; terms, find the value of the denominator.

(let ((res 1))
  (loop for n from 10 below 100 do
    (loop for d from (+ n 1) below 100 do
      (multiple-value-bind (nq nr) (truncate n 10)
        (multiple-value-bind (dq dr) (truncate d 10)
          (when (and (< 0 dr) (= nr dq) (= (/ nq dr) (/ n d)))
            (setf res (* res (/ n d))))))))
  (denominator res)) ; => 100
