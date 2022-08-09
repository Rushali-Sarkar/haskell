-- Problem 6
-- The sum of the squares of first ten natural numbers is
-- 1 ^  2 + 2 ^ 2 + 3 ^ 2 + ... + 10 ^ 2 = 285
-- The square of the sum of the first ten natural numbers is
-- (1 + 2 + 3 + 4 + .. + 10) ^ 2 = 3025
-- Hence the difference between the sum of the squares of the first ten natural number and the square of the sum is
-- 3025 - 385 = 2640
-- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum


squareOfSum :: Integer -> Integer
squareOfSum x = (sum [1..x]) * (sum [1..x])

sumOfSquares :: Integer -> Integer
sumOfSquares x = sum [i * i | i <- [1..x]]

difference :: Integer -> Integer
difference x = (squareOfSum x) - (sumOfSquares x)

main = do
    print $ difference 10
    print $ difference 100
