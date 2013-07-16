\ A palindromic number reads the same both ways. The largest palindrome made
\ from the product of two 2-digit numbers is 9009 = 91 × 99.

\ Find the largest palindrome made from the product of two 3-digit numbers.

: factor-next-digit ( m₁…mₙ n₁…nₙ₋₁nₙ -- m₁…mₙnₙ n₁…nₙ₋₁ )
    10 /mod rot 10 * rot + swap ;

: reverse ( n -- n-reverse )
    0 swap
    begin
        factor-next-digit
        dup 0=
    until
    drop ;

: palindrome? ( n -- f )
    dup reverse = ;

: check-number ( high n -- new-high )
    dup palindrome? if max else drop then ;

: largest-palindrome ( -- n )
    0 ( high-score )
    999 100 do
        999 100 do
            i j * check-number
        loop
    loop ;

largest-palindrome . \ => 906609