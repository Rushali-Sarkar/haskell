import Data.Char

numToDigits :: Int -> [Int]
numToDigits = map digitToInt . show

isArmstrong :: Int -> Bool
isArmstrong number = number == sum [digit ^ power | digit <- digits]
                                where digits = numToDigits number
                                      power = length digits

getArmstrong :: Int -> Int -> [Int]
getArmstrong start limit = filter isArmstrong [start..limit]

main = do
    start <- getLine
    end <- getLine
    print $ getArmstrong (read start :: Int) (read end :: Int)
