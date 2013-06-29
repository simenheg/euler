;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for
;; which, a² + b² = c²

;; For example, 3² + 4² = 9 + 16 = 25 = 5².

;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;; Find the product abc.

(loop for c below 1000 do
  (loop for b below c do
    (loop for a below b
          when (and (= 1000 (+ a b c)) (= (+ (* a a) (* b b)) (* c c)))
          do (princ (* a b c)))))

;; => 31875000
