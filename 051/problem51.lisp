;; By replacing the 1ˢᵗ digit of the 2-digit number *3, it turns out that six
;; of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.

;; By replacing the 3ʳᵈ and 4ᵗʰ digits of 56**3 with the same digit, this
;; 5-digit number is the first example having seven primes among the ten
;; generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663,
;; 56773, and 56993. Consequently 56003, being the first member of this
;; family, is the smallest prime with this property.

;; Find the smallest prime which, by replacing part of the number (not
;; necessarily adjacent digits) with the same digit, is part of an eight prime
;; value family.

(defun primes-below (n)
  "Return a list of prime numbers below N, using the sieve of Eratosthenes."
  (cons 2 (let ((sieve (make-array n :element-type 'bit)))
            (loop for i from 3 below n by 2
                  when (= 0 (sbit sieve i)) collect i and do
              (loop for j from (expt i 2) below n by i do
                (setf (sbit sieve j) 1))))))

(defun number-to-vector (n)
  "Return a vector of the digits of N."
  (map 'vector #'digit-char-p (prin1-to-string n)))

(defun decimal-to-binary-list (x)
  "Return a list of bits representing the decimal number N."
  (do ((x x (floor x 2))
       (list '() (cons (mod x 2) list)))
      ((= x 0) list)))

(defun bitstrings-of-length (n)
  "Return a list of every bitstring vector of length N."
  (mapcar
   (lambda (l)
     (coerce
      (append (make-list (- n (length l)) :initial-element 0) l)
      'vector))
   (loop for i from 1 to (1- (expt 2 n)) collect (decimal-to-binary-list i))))

(defun mask (n mask)
  "Return a copy of vector N filled with `x' in positions where MASK has a 0."
  (loop for i from 0 to (1- (length n)) collect
    (if (= (aref mask i) 0) 'x (aref n i))))

(defun mask-ok-p (n mask)
  "Return T if applying MASK to N only masks out instances of the same
number."
  (let ((v nil))
    (dotimes (i (length n) t)
      (when (= (aref mask i) 0)
        (if v
            (unless (= v (aref n i))
              (return nil))
            (setf v (aref n i)))))))

(defun smallest-prime-in-family (family)
  "Return the smallest prime which, by replacing part of the number (not
necessarily adjacent digits) with the same digit, is part of a FAMILY prime
value family."
  (loop named main for len from 1 do
    (loop for bs in (nreverse (bitstrings-of-length len))
          with pr = (remove-if (lambda (n) (< n (expt 10 (1- len))))
                               (primes-below (expt 10 len))) do
      (let ((map (make-hash-table :test #'equal)))
        (dolist (p (reverse pr))
          (let ((n (number-to-vector p)))
            (when (mask-ok-p n bs)
              (let ((res (incf (gethash (mask n bs) map 0))))
                (when (= res family)
                  (return-from main p))))))))))

(smallest-prime-in-family 8) ;; => 121313
