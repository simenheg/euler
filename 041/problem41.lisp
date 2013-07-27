;; We shall say that an n-digit number is pandigital if it makes use of all
;; the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital
;; and is also prime.

;; What is the largest n-digit pandigital prime that exists?

(defun primes-below (n)
  "Return a list of prime numbers below N, using the sieve of Eratosthenes."
  (cons 2 (let ((sieve (make-array n :element-type 'bit)))
            (loop for i from 3 below n by 2
                  when (= 0 (sbit sieve i)) collect i and do
              (loop for j from (expt i 2) below n by i do
                (setf (sbit sieve j) 1))))))

(defun pandigital-p (n)
  (let ((n-str (write-to-string n)))
    (string=
     (sort n-str #'char<)
     (format nil "~{~a~}" (loop for i from 1 to (length n-str) collect i)))))

;; Disregard 8- and 9-pandigital numbers, as they can never be prime
(find-if #'pandigital-p (reverse (primes-below 7654322))) ; => 7652413
