\ Each new term in the Fibonacci sequence is generated by adding the
\ previous two terms. By starting with 1 and 2, the first 10 terms will be:

\ 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

\ By considering the terms in the Fibonacci sequence whose values do not
\ exceed four million, find the sum of the even-valued terms.

: even? ( n -- f ) 2 mod 0= ;

: next-fib ( fₙ₋₂ fₙ₋₁ -- fₙ₋₁ fₙ ) 2dup + rot drop ;

: inc-sum ( sum fₙ₋₁ fₙ -- sum+fₙ fₙ₋₁ fₙ ) tuck 2swap + -rot ;

: sum-even-fibs { limit -- sum }
    0 ( initial sum )
    1 ( 1st Fibonacci number )
    1 ( 2nd Fibonacci number )
    begin
        next-fib
        dup limit <
    while
        dup even? if inc-sum then
    repeat
    2drop ;

4000000 sum-even-fibs . \ => 4613732