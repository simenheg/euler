\ If we list all the natural numbers below 10 that are multiples of 3 or 5,
\ we get 3, 5, 6 and 9. The sum of these multiples is 23.

\ Find the sum of all the multiples of 3 or 5 below 1000.

: sum-multiples ( n -- sum )
    0 swap
    0 do
        i 3 mod 0=
        i 5 mod 0= or
        if i + then
    loop ;

1000 sum-multiples . \ => 233186
