import Data.Char
import Data.List

numberToDigits :: Int -> [Int]
numberToDigits = map digitToInt . show

appendTwoDigits :: Int -> Int -> Int
appendTwoDigits digit1 digit2 = 10 * digit1 + digit2

digitsToNumber :: [Int] -> Int
digitsToNumber = foldl1 appendTwoDigits

smallest :: Int -> Int
smallest = digitsToNumber . sort . numberToDigits

reverseList :: [Int] -> [Int]
reverseList list | length list == 1 = [head list]
                 | otherwise        = [last list] ++ reverseList (init list)

largest :: Int -> Int
largest =  digitsToNumber . reverseList . sort . numberToDigits

difference :: Int -> Int
difference number = largest number - smallest number

isDigitsEqual :: Int -> Int -> Bool
isDigitsEqual number1 number2 = (smallest number1) == (smallest number2)

list :: Int -> [Int]
list number = [(largest number), (smallest number), (difference number)]

kaprekarSequence :: [Int] -> [[Int]]
kaprekarSequence numberList | isDigitsEqual (head numberList) (last numberList) = [list (head numberList)]
                            | otherwise = [list (head numberList)] ++ kaprekarSequence (list (last numberList))

main = do
    number <- getLine
    print $ kaprekarSequence (list (read number :: Int))

