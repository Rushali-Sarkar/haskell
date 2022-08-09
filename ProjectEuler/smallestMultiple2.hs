-- Problem 5
-- 2520 is the smallest number that can be divided by each of the numbers 1 to 10 without any remainder.
-- What is the smallest positive number that is evenly divisible by all the numbers from 1 to 20 ?

smallestMultiple :: Integer -> Integer
smallestMultiple x = foldl lcm 2 [3..x]

main = do
    print $ smallestMultiple 10
    print $ smallestMultiple 20
    print $ smallestMultiple 50
    print $ smallestMultiple 100
    print $ smallestMultiple 200
