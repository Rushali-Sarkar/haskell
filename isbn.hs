-- https://www.codewars.com/kata/51fc12de24a9d8cb0e000001

import Data.Char

isCombinationValid :: String -> Bool
isCombinationValid isbn | length isbn == 1 = head isbn `elem` ['0'..'9'] ++ ['X']
isCombinationValid isbn | head isbn `elem` ['0'..'9'] = isCombinationValid (tail isbn)
isCombinationValid isbn | otherwise = False

convertISBN :: String -> [Int]
convertISBN isbn = [if digit == 'X' then 10 else digitToInt digit | digit <- isbn]

sumList :: [Int] -> Int
sumList numbers | length numbers == 0 = 0
sumList numbers | otherwise = head numbers + sumList (tail numbers)

isbnSum :: String -> Int
isbnSum isbn =  sumList (zipWith (*) [1..10] (convertISBN isbn))

isValidISBN :: String -> Bool
isValidISBN isbn = length isbn == 10 && isCombinationValid isbn && isbnSum isbn `mod` 11 == 0

main = do
    isbn <- getLine
    print $ isValidISBN isbn
