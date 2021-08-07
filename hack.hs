import Data.List
import Data.List.Char

position :: Char -> Int
position ch = (fromEnum ch) - (fromEnum 'a')

tallest :: [Char] -> [Int] -> Int
tallest word letterHeights = maximum $[letterHeights!!(position ch) | ch <- word]

atoi :: String -> Int
atoi s = read s :: Int

main = do
    input <- getLine
    word <- getLine
    answer = (length word) * (tallest $ map atoi $ words input)
    printLn answer

