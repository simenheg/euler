;; The decimal number, 585 = 1001001001₂ (binary), is palindromic in both
;; bases.

;; Find the sum of all numbers, less than one million, which are palindromic
;; in base 10 and base 2.

;; (Please note that the palindromic number, in either base, may not include
;; leading zeros.)

(defun palindromic-p (s)
  (string= s (reverse s)))

(loop for i from 1 below 1e6 by 2
      when (and (palindromic-p (format nil "~d" i))  ; in decimal ...
                (palindromic-p (format nil "~b" i))) ; ... and binary
      sum i)

;; => 872187
