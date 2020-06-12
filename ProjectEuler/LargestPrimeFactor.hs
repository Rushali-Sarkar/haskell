-- Largest prime factor
-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143

import Data.List

floorSquareRoot :: Int -> Int
floorSquareRoot = floor . sqrt . fromIntegral

isPrime :: Int -> Bool
isPrime number | elem number [0, 1]             = False
               | elem number [2, 3, 5, 7]       = True
               | even number                    = False
               | mod number 3 == 0              = False
               | mod number 5 == 0              = False
               | mod number 7 == 0              = False
               | otherwise                      = and [mod number f /= 0 | f <- [6, 7..limit]] 
                                                        where limit = floorSquareRoot number
isDivisible :: Int -> Int -> Bool
isDivisible number divisor = mod number divisor == 0

allFactors :: Int -> Int -> [Int]
allFactors number factor | factor <= 1 = if even number then [2] else []
                         | isDivisible number factor   =  [factor, (quot number factor)] ++ allFactors number (factor - 1)
                         | otherwise                   =   allFactors number (factor - 1)

main = do
    number <- getLine
    print $ last (filter isPrime (sort (nub (allFactors (read number :: Int) (floorSquareRoot (read number :: Int))))))

