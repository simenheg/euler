-- Pentagonal numbers are generated by the formula, Pₙ=n(3n−1)/2. The first
-- ten pentagonal numbers are:

-- 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

-- It can be seen that P₄ + P7 = 22 + 70 = 92 = P₈. However, their
-- difference, 70 − 22 = 48, is not pentagonal.

-- Find the pair of pentagonal numbers, Pⱼ and Pₖ, for which their sum and
-- difference are pentagonal and D = |Pₖ − Pⱼ| is minimised; what is the
-- value of D?

penta :: Int -> Int
penta n = n * (3*n-1) `div` 2

isPenta :: Int -> Bool
isPenta n = n == penta(i)
  where i = round $ (1 + sqrt(fromIntegral $ 1 + 24*n)) / 6

main = print $ head solutions -- => 5482660
  where pentas = map penta [1 ..]
        solutions = [pk - pi | pk <- pentas, pi <- takeWhile (< pk) pentas,
                               isPenta(pk - pi), isPenta(pk + pi)]