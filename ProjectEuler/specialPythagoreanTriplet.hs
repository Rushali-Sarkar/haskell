-- Problem 9
-- A pythagorean triplet is a set of three numbers, a < b < c, for which,
-- a ** 2  + b ** 2 = c ** 2
-- For example, 3 ** 2 + 4 ** 2 = 5 ** 2
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000
-- Find the product abc

import Data.List

getIntegerSquareRoot :: Int -> Int
getIntegerSquareRoot = floor . sqrt .fromIntegral

getFactorTuples :: Int -> [(Int, Int)]
getFactorTuples limit = [(x, div limit x) | x <- [1..(getIntegerSquareRoot limit)], mod limit x == 0]

getPossibleTriplets :: Int -> [(Int, Int, Int)]
getPossibleTriplets limit = [(2 * m * (n - m), m * m - (n - m) * (n - m), m * m + (n - m) * (n - m)) | (m, n) <- getFactorTuples (div limit 2)]

getSpecialTriplet :: Int -> [[Int]]
getSpecialTriplet limit = [sort [a, b, c] | (a, b, c) <- getPossibleTriplets limit, a <= limit && b <= limit && c <= limit && a >= 0 && b >= 0 && c >= 0]


main = do
    print $ getSpecialTriplet 1000
    print $ getSpecialTriplet 12
