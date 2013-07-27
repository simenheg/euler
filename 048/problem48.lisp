;; The series, 1¹ + 2² + 3³ + ... + 10¹⁰ = 10405071317.

;; Find the last ten digits of the series, 1¹ + 2² + 3³ + ... + 1000¹⁰⁰⁰.

(let ((number (write-to-string (loop for i from 1 to 1000 sum (expt i i)))))
  (subseq number (- (length number) 10))) ; => 9110846700
