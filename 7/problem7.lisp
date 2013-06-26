;; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
;; see that the 6th prime is 13.

;; What is the 10 001st prime number?

(defun primes-below (n)
  "Return a list of prime numbers below N, using the sieve of Eratosthenes."
  (cons 2 (let ((sieve (make-array n :element-type 'bit)))
            (loop for i from 3 below n by 2
                  when (= 0 (sbit sieve i)) collect i and do
              (loop for j from (expt i 2) below n by i do
                (setf (sbit sieve j) 1))))))

(nth 10000 (primes-below 200000))

;; => 104743
