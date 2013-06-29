;; How many Sundays fell on the first of the month during the twentieth
;; century (1 Jan 1901 to 31 Dec 2000)?

(defun sundays-on-the-first (y m end-year end-month)
  (let ((sundays 0))
    (while (not (and (= y end-year) (= m end-month)))
      (when (equal "Sunday" (calendar-day-name (list m 1 y)))
        (incf sundays))
      (calendar-increment-month m y 1))
    sundays))

(sundays-on-the-first 1901 1 2000 12) ; => 171
