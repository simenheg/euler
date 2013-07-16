;; The number 3797 has an interesting property. Being prime itself, it is
;; possible to continuously remove digits from left to right, and remain
;; prime at each stage: 3797, 797, 97, and 7. Similarly we can work from
;; right to left: 3797, 379, 37, and 3.

;; Find the sum of the only eleven primes that are both truncatable from
;; left to right and right to left.

;; NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

(defun primes-below (n)
  (let ((sieve (make-array n :initial-element t)))
    (loop for i from 2 below n when (aref sieve i) do
      (loop for j from (expt i 2) below n by i do
        (setf (aref sieve j) nil)))
    sieve))

(defun magnitude (n)
  (do ((i n (truncate i 10)) (m 0 (+ m 1))) ((= 0 i) m)))

(defun mirror-number (n)
  (if (< n 10)
      n
      (+ (* (mod n 10) (expt 10 (- (magnitude n) 1)))
         (mirror-number (truncate n 10)))))

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
