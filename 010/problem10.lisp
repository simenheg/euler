;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;; Find the sum of all the primes below two million.

(defun primes-below (n)
  "Return a list of prime numbers below N, using the sieve of Eratosthenes."
  (cons 2 (let ((sieve (make-array n :element-type 'bit)))
            (loop for i from 3 below n by 2
                  when (= 0 (sbit sieve i)) collect i and do
              (loop for j from (expt i 2) below n by i do
                (setf (sbit sieve j) 1))))))

(reduce #'+ (primes-below 2000000)) ; => 142913828922
