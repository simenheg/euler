;; The number, 197, is called a circular prime because all rotations of the
;; digits: 197, 971, and 719, are themselves prime.

;; There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
;; 71, 73, 79, and 97.

;; How many circular primes are there below one million?

(defun primes-below (n)
  (let ((sieve (make-array n :initial-element t)))
    (loop for i from 2 below n when (aref sieve i) do
      (loop for j from (expt i 2) below n by i do
        (setf (aref sieve j) nil)))
    sieve))

(defun magnitude (n)
  (do ((i n (truncate i 10)) (m 0 (+ m 1))) ((= 0 i) m)))

(defun rotations (n &optional (count (- (magnitude n) 1)))
  "Return every rotation of N (not including N itself)."
  (unless (= count 0)
    (let ((next (+ (truncate n 10)
                   (* (mod n 10) (expt 10 (- (magnitude n) 1))))))
      (cons next (rotations next (- count 1))))))

(let ((primes (primes-below 1000000)))
  (labels ((prime-p (i) (aref primes i)))
    (loop for i from 2 below 1000000
          when (and (prime-p i) (every #'prime-p (rotations i)))
          count i))) ; => 55
