! The primes 3, 7, 109, and 673, are quite remarkable. By taking
! any two primes and concatenating them in any order the result
! will always be prime. For example, taking 7 and 109, both 7109
! and 1097 are prime. The sum of these four primes, 792,
! represents the lowest sum for a set of four primes with this
! property.

! Find the lowest sum for a set of five primes for which any two
! primes concatenate to produce another prime.

USING: combinators.short-circuit.smart fry kernel math
math.functions math.primes math.ranges memoize sequences
sequences.deep ;
IN: problem60

CONSTANT: limit 10000

MEMO: prime?* ( n -- ? )
    prime? ;

: number-length ( n -- n )
    log10 >integer 1 + ;

: number-cat ( m n -- mn )
    swap over number-length 10^ * + ;

: cat-prime? ( m n -- ? )
    2dup swap [ number-cat prime?* ] 2bi@ and ;

: cat-prime-set? ( seq -- ? )
    unclip [ cat-prime? ] curry all? ;

: extend ( seq -- seq )
    dup first prefix ;

: above-limit? ( seq -- ? )
    first limit > ;

: inc-first-prime ( seq -- seq )
    unclip next-prime prefix ;

: next-candidate ( seq -- seq )
    dup cat-prime-set? [ extend ] when
    dup above-limit? [ rest ] when
    inc-first-prime ;

: finished? ( target-size seq -- ? )
    { [ length = ] [ cat-prime-set? nip ] } && ;

: cat-prime-sum ( target-size init-set -- sum )
    [ 2dup finished? ] [ next-candidate ] until nip sum ;

: problem60 ( -- answer )
    5 { 673 109 7 3 } cat-prime-sum ;
