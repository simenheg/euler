;; An irrational decimal fraction is created by concatenating the positive
;; integers:

;; 0.123456789101112131415161718192021...

;; It can be seen that the 12ᵗʰ digit of the fractional part is 1.

;; If dₙ represents the nᵗʰ digit of the fractional part, find the value of
;; the following expression.

;; d₁ × d₁₀ × d₁₀₀ × d₁₀₀₀ × d₁₀₀₀₀ × d₁₀₀₀₀₀

(let ((str (do ((i 1 (+ i 1))
                (s "" (concatenate 'string s (write-to-string i))))
               ((< 100000 (length s)) s))))
  (reduce #'* (mapcar (lambda (i) (parse-integer (string (char str (- i 1)))))
                      '(1 10 100 1000 10000 100000))))

;; => 210
