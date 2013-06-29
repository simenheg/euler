;; Euler discovered the remarkable quadratic formula:

;; n² + n + 41

;; It turns out that the formula will produce 40 primes for the consecutive
;; values n = 0 to 39. However, when n = 40, 40² + 40 + 41 = 40(40 + 1) + 41
;; is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly
;; divisible by 41.

;; The incredible formula n² − 79n + 1601 was discovered, which produces 80
;; primes for the consecutive values n = 0 to 79. The product of the
;; coefficients, −79 and 1601, is −126479.

;; Considering quadratics of the form:

;;     n² + an + b, where |a| < 1000 and |b| < 1000

;;     where |n| is the modulus/absolute value of n
;;     e.g. |11| = 11 and |−4| = 4

;; Find the product of the coefficients, a and b, for the quadratic
;; expression that produces the maximum number of primes for consecutive
;; values of n, starting with n = 0.

(let* ((n 1000000)
       (sieve (make-array n :element-type 'bit)))
  (loop for i from 3 below n by 2
        when (= 0 (sbit sieve i)) collect i and do
    (loop for j from (expt i 2) below n by i do
      (setf (sbit sieve j) 1)))
  (defun prime-p (n)
    (and (plusp n)
         (or (= n 2)
             (and (not (evenp n))
                  (= (sbit sieve n) 0))))))

(defun max-n (a b n)
  (if (prime-p (+ (expt n 2) (* a n) b))
      (max-n a b (+ n 1))
      n))

(let ((max 0)
      (max-n 0))
  (loop for a from -999 below 1000 do
    (loop for b from -999 below 1000 do
      (when (< max-n (max-n a b 0))
        (setf max-n (max-n a b 0))
        (setf max (* a b)))))
  max) ; => -59231
