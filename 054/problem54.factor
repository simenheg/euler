! In the card game poker, a hand consists of five cards and are
! ranked, from lowest to highest, in the following way:

! High Card: Highest value card.
! One Pair: Two cards of the same value.
! Two Pairs: Two different pairs.
! Three of a Kind: Three cards of the same value.
! Straight: All cards are consecutive values.
! Flush: All cards of the same suit.
! Full House: Three of a kind and a pair.X
! Four of a Kind: Four cards of the same value.
! Straight Flush: All cards are consecutive values of same suit.
! Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

! The cards are valued in the order:
! 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

! If two players have the same ranked hands then the rank made
! up of the highest value wins; for example, a pair of eights
! beats a pair of fives. But if two ranks tie, for example, both
! players have a pair of queens, then highest cards in each hand
! are compared; if the highest cards tie then the next highest
! cards are compared, and so on.

! The file, poker.txt, contains one-thousand random hands dealt
! to two players. Each line of the file contains ten cards
! (separated by a single space): the first five are Player 1's
! cards and the last five are Player 2's cards. You can assume
! that all hands are valid (no invalid characters or repeated
! cards), each player's hand is in no specific order, and in
! each hand there is a clear winner.

! How many hands does Player 1 win?

USING: accessors assocs combinators grouping io.encodings.ascii
io.files kernel math math.order math.parser sequences sets
sorting splitting ;
IN: problem54

TUPLE: card value suit ;

: high-value>rank ( high-value -- rank )
    { { "T" 10 } { "J" 11 } { "Q" 12 } { "K" 13 } { "A" 14 } } at ;

: value>rank ( value -- rank )
    dup string>number [ string>number ] [ high-value>rank ] if ;

: <card> ( card-spec -- card )
    1 cut [ value>rank ] dip card boa ;

: values ( hand -- seq )
    [ value>> ] map ;

: value-dups ( hand -- seq )
    values duplicates ;

: one-pair? ( hand -- ? )
    value-dups length 1 = ;

: two-pairs? ( hand -- ? )
    value-dups length 2 >= ;

: three-of-a-kind? ( hand -- ? )
    value-dups duplicates length 1 = ;

: straight? ( hand -- ? )
    values dup rest [ - ] 2map [ 1 = ] all? ;

: flush? ( hand -- ? )
    [ suit>> ] map all-equal? ;

: full-house? ( hand -- ? )
    value-dups length 3 = ;

: four-of-a-kind? ( hand -- ? )
    value-dups [ length 3 = ] [ all-equal? ] bi and ;

: straight-flush? ( hand -- ? )
    [ straight? ] [ flush? ] bi and ;

: hands ( str -- seq1 seq2 )
    " " split [ <card> ] map 5 cut ;

: hand>score ( seq -- n )
    [ value>> ] inv-sort-with {
        { [ dup straight-flush? ] [ 8 ] }
        { [ dup four-of-a-kind? ] [ 7 ] }
        { [ dup full-house? ] [ 6 ] }
        { [ dup flush? ] [ 5 ] }
        { [ dup straight? ] [ 4 ] }
        { [ dup three-of-a-kind? ] [ 3 ] }
        { [ dup two-pairs? ] [ 2 ] }
        { [ dup one-pair? ] [ 1 ] }
        [ 0 ]
    } cond [ values dup duplicates swap append ] dip prefix ;

: count-wins ( seq -- n )
    [ hands [ hand>score ] bi@ <=> ] map [ +gt+ = ] count ;

: problem54 ( -- answer )
    "poker.txt" ascii file-lines count-wins ;
