-- Problem 5
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder
-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20


isDivisibleByAll :: Int -> Bool
isDivisibleByAll x = all (== True) [(mod x each) == 0 | each <- [1..20]]

smallestMultiple :: Int
smallestMultiple = head [x | x <- [20,40..], isDivisibleByAll x]

main = do
    print $ smallestMultiple
