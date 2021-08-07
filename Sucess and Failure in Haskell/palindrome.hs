import Data.List
import Data.Char

isNotPunctuation :: Char -> Bool
isNotPunctuation = not.isPunctuation

removePunctuation :: String -> String
removePunctuation word = filter isNotPunctuation word

removeSpace :: String -> String
removeSpace word = filter (/=' ') word

convertSmall :: String -> String
convertSmall word = [toLower x | x <- word]

isPalindrome :: String -> Bool
isPalindrome word = word == reverse word

isWord :: String -> Maybe String
isWord word =
    case (null word) of
        True -> Nothing
        False ->
            case (all isAlpha word) of
                True -> Just word
                False -> Nothing

checkPalindrome :: String -> String
checkPalindrome word =
    case (isWord (removePunctuation (removeSpace word))) of
        Nothing -> "The word entered is invalid."
        Just word -> 
            case (isPalindrome (convertSmall word)) of
                True -> "The word is palindrome."
                False -> "The word is not palindrome."

main :: IO()
main = do 
    putStr "Enter a Word.\n>"
    word <- getLine
    print $ checkPalindrome word