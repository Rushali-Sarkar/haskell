-- Problem 7
-- By listing the first six prime numbers: 2, 3, 5, 7, 11 and 13 we can see 6th
-- What is 10001st prime number ?

isPrime :: Int -> Bool
isPrime number | elem number [0, 1]       = False
isPrime number | elem number [2, 3, 5, 7] = True
isPrime number | even number              = False
isPrime number | mod number 3 == 0        = False
isPrime number | mod number 5 == 0        = False
isPrime number | mod number 7 == 0        = False
isPrime number | otherwise                = all (== True) [mod number factor /= 0 | factor <- [6,7..limit]]
                                                            where limit = floor (sqrt (fromIntegral number))


prime10001 :: Int
prime10001 = [x | x <- [1,2..], isPrime x] !! 10000 

main = do
    print $ prime10001
