;; Each character on a computer is assigned a unique code and the preferred
;; standard is ASCII (American Standard Code for Information Interchange). For
;; example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

;; A modern encryption method is to take a text file, convert the bytes to
;; ASCII, then XOR each byte with a given value, taken from a secret key. The
;; advantage with the XOR function is that using the same encryption key on
;; the cipher text, restores the plain text; for example, 65 XOR 42 = 107,
;; then 107 XOR 42 = 65.

;; For unbreakable encryption, the key is the same length as the plain text
;; message, and the key is made up of random bytes. The user would keep the
;; encrypted message and the encryption key in different locations, and
;; without both "halves", it is impossible to decrypt the message.

;; Unfortunately, this method is impractical for most users, so the modified
;; method is to use a password as a key. If the password is shorter than the
;; message, which is likely, the key is repeated cyclically throughout the
;; message. The balance for this method is using a sufficiently long password
;; key for security, but short enough to be memorable.

;; Your task has been made easy, as the encryption key consists of three lower
;; case characters. Using cipher1.txt (right click and 'Save Link/Target
;; As...'), a file containing the encrypted ASCII codes, and the knowledge
;; that the plain text must contain common English words, decrypt the message
;; and find the sum of the ASCII values in the original text.

(require srfi/1) ; needed for `circular-list'
(require srfi/42) ; needed for `list-ec'

(define (key->wheel key)
  (apply circular-list (map char->integer (string->list key))))

(define (decipher cipher key)
  (define (iter wheel ciph res)
    (if (null? ciph)
        (list->string (map integer->char (reverse res)))
        (iter (cdr wheel) (cdr ciph)
              (cons (bitwise-xor (first wheel) (first ciph)) res))))
  (iter (key->wheel key) cipher '()))

(define possible-keys
  (list-ec (: a #\a #\z) (: b #\a #\z) (: c #\a #\z) (string a b c)))

(define (rank text)
  (count (lambda (c) (and (char>=? c #\a) (char<=? c #\z)))
         (string->list text)))

(define (ranked-cipher-list cipher)
  (sort
   (map (lambda (k)
          (let ((res (decipher cipher k)))
            (list res (rank res) k)))
        possible-keys)
   (lambda (t1 t2) (> (cadr t1) (cadr t2)))))

(define (csv-file->list file)
  (map string->number
       (string-split (first (file->lines file)) ",")))

(let* ((cipher (csv-file->list "cipher1.txt"))
       (rank (ranked-cipher-list cipher)))
  (apply + (map char->integer (string->list (first (first rank))))))

;; => 107359
