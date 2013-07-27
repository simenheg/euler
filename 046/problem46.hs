-- It was proposed by Christian Goldbach that every odd composite number can
-- be written as the sum of a prime and twice a square.

-- 9 = 7 + 2×1²
-- 15 = 7 + 2×2²
-- 21 = 3 + 2×3²
-- 25 = 7 + 2×3²
-- 27 = 19 + 2×2²
-- 33 = 31 + 2×1²

-- It turns out that the conjecture was false.

-- What is the smallest odd composite that cannot be written as the sum of a
-- prime and twice a square?

import Data.List

primes :: [Int]
primes = 2:sieve [3, 5 ..] where
  sieve (x:xs) = x:sieve(filter (\n -> n `mod` x /= 0) xs)

main = print $ find counterproof compositeOdds -- => 5777
  where compositeOdds = [n | n <- [3, 5 ..],
                             n `notElem` takeWhile (<= n) primes]
        counterproof n = null [n | s <- takeWhile (< n) [2*n^2 | n <- [1 ..]],
                                   p <- takeWhile (< n + s) primes,
                                   p + s == n]
