import Data.Maybe
import Data.List
import qualified Data.Map.Strict as Map

upto20 = ["", "One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine ", "Ten ", "Eleven ", "Twelve ", "Thirteen ", "Fourteen ", "Fifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen "]

tens = ["", "Ten ",  "Twenty ", "Thirty ", "Fourty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety "]

hun = "Hundred "
han = "Hundred And "

idenoms = [1, 1, 1, 1000, 1000, 10 ^ 5, 10 ^ 5, 10 ^ 7, 10 ^ 7, 10 ^ 9, 10 ^ 9, 10 ^ 11, 10 ^ 11, 10 ^ 13, 10 ^ 13, 10 ^ 15, 10 ^ 15, 10 ^ 17, 10 ^ 17, 10 ^ 19, 10 ^ 19]
wdenoms = [1, 1, 1, 1000, 1000, 10 ^ 6, 10 ^ 6, 10 ^ 6, 10 ^ 9, 10 ^ 9, 10 ^ 9, 10 ^ 12, 10 ^ 12, 10 ^ 12, 10 ^ 15, 10 ^ 15, 10 ^ 15, 10 ^ 18, 10 ^ 18]

indianDenoms = [1, 1000, 10 ^ 5, 10 ^ 7, 10 ^ 9, 10 ^ 11, 10 ^ 13, 10 ^ 15, 10 ^ 17, 10 ^ 19]
indianNames  = ["", "Thousand ", "Lakh ", "Crore ", "Arab ", "Kharab ", "Neel ", "Padma ", "Shankh "]
indianDenomNames = Map.fromAscList $ zip indianDenoms indianNames

westernDenoms = [1, 1000, 10 ^ 6, 10 ^ 9, 10 ^ 12, 10 ^ 15, 10 ^ 18]
westernNames = ["", "Thousand ", "Million ", "Billion ", "Trillion ", "Quadrillion ", "Quintillion "]
westernDenomNames = Map.fromAscList $ zip westernDenoms westernNames

convertupto2digits :: Int -> String
convertupto2digits number | number < 20 = upto20 !! number
convertupto2digits number | otherwise   = (tens !! (div number 10)) ++ (upto20 !! (mod number 10))

convertupto3digits :: Int -> String
convertupto3digits number | number < 100        = convertupto2digits number
convertupto3digits number | mod number 100 == 0 = (upto20 !! (div number 100)) ++ hun
convertupto3digits number | otherwise = (upto20 !! (div number 100)) ++ han ++ (convertupto2digits(mod number 100))

reverseList :: [Int] -> [Int]
reverseList list | length list == 1 = [head list]
reverseList list | otherwise        = [last list] ++ reverseList (init list)

getDenoms :: Int -> [Int]
getDenoms number  = reverseList (map (idenoms !!) [0..len])
                   where len = (length (show number)) - 1

splitIntoDenoms :: Int -> [Int] -> [(Int, Int)]
splitIntoDenoms amount denoms | length denoms == 1 = [(head denoms, amount)]
                        | otherwise = (denom, div amount denom) : splitIntoDenoms (mod amount denom) (tail denoms)
                                  where denom = head denoms

convert :: (Int, Int) -> String
convert (denom,     0) = ""
convert (denom, digit) = convertupto3digits digit ++ fromJust (Map.lookup denom indianDenomNames)

fig2words :: [(Int, Int)] -> String
fig2words denomDigitList | length denomDigitList == 1 = convert (head denomDigitList)
fig2words denomDigitList | otherwise = convert (head denomDigitList) ++ fig2words (tail denomDigitList)

main = do
    number <- getLine
    print $ fig2words (splitIntoDenoms (read number :: Int) (getDenoms (read number :: Int)))

