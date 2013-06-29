(defun spiral-sum (dim)
  (1- (loop for n below dim sum (+ (* 2 n n) (* 3 n) (- 3 (mod (1+ n) 2))))))

(spiral-sum 1001) ; => 669171001
