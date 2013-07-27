;; The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
;; increases by 3330, is unusual in two ways: (i) each of the three terms
;; are prime, and, (ii) each of the 4-digit numbers are permutations of one
;; another.

;; There are no arithmetic sequences made up of three 1-, 2-, or 3-digit
;; primes, exhibiting this property, but there is one other 4-digit
;; increasing sequence.

;; What 12-digit number do you form by concatenating the three terms in this
;; sequence?

(defun primes-below (n)
  "Return a list of prime numbers below N, using the sieve of Eratosthenes."
  (cons 2 (let ((sieve (make-array n :element-type 'bit)))
            (loop for i from 3 below n by 2
                  when (= 0 (sbit sieve i)) collect i and do
              (loop for j from (expt i 2) below n by i do
                (setf (sbit sieve j) 1))))))

(defun primes-between (low high)
  "Return the list of primes between LOW and HIGH."
  (remove-if (lambda (x) (< x low)) (primes-below high)))

(defun permutations-p (&rest nums)
  "Return T if every given number is a permutation of another."
  (let ((sorted (mapcar (lambda (n) (sort (write-to-string n) #'char<)) nums)))
    (every (lambda (s) (string= (first sorted) s)) sorted)))

(let ((candidates (primes-between 1000 10000))
      (prime-table (make-hash-table)))
  (dolist (prime candidates)
    (setf (gethash prime prime-table) t))
  (labels ((prime-p (x) (gethash x prime-table)))
    (dolist (n1 candidates)
      (loop for i from 1 and n2 = (+ n1 i) and n3 = (+ n1 i i)
            until (<= 10000 n3) do
        (when (and (prime-p n2) (prime-p n3) (permutations-p n1 n2 n3))
          (format t "~a, ~a, ~a (increases by ~a)~%" n1 n2 n3 i))))))

;; =>
;; 1487, 4817, 8147 (increases by 3331)
;; 2969, 6299, 9629 (increases by 3331)
