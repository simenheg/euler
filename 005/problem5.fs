\ 2520 is the smallest number that can be divided by each of the numbers
\ from 1 to 10 without any remainder.

\ What is the smallest positive number that is evenly divisible by all of
\ the numbers from 1 to 20?

: divisible? ( n m -- f ) mod 0= ;

: divisible-1-to-20? { n -- f }
    n 19 divisible?
    n 18 divisible? and
    n 17 divisible? and
    n 16 divisible? and
    n 13 divisible? and
    n 11 divisible? and
    n 7 divisible? and ;

: smallest-divisible-1-to-20 ( -- n )
    2520 ( initial candidate )
    begin
        20 +
        dup divisible-1-to-20?
    until ;

smallest-divisible-1-to-20 . \ => 232792560