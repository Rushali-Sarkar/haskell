-- The underscore after the equals sign is called a hole or a typed hole.
-- Holes are always represented by an underscore alone or suffixed by a name, as in _a, _b, and the like.
-- Holes can be useful as a development technique.
-- The nesting indentation in Case statements is necessary because Haskell is very white space sensitive
-- Checking how it works

import Data.List
import Data.Char

isAnagram :: String -> String -> Bool
isAnagram word1 word2 = (sort word1) == (sort word2) 

isWord :: String -> Maybe String
isWord word =
    case (null word) of
        True -> Nothing
        False ->
            case (all isAlpha word) of
                True -> Just word
                False -> Nothing 

checkAnagram :: String -> String -> String
checkAnagram word1 word2 =
    case (isWord word1) of
        Nothing -> "The first word is invalid."
        Just word1 -> 
            case (isWord word2) of
                Nothing -> "The second word is invalid."
                Just word2 ->
                    case (isAnagram word1 word2) of
                        True -> "These words are anagrams."
                        False -> "These words are not anagrams."
main :: IO ()
main = do 
    putStr "Please Enter a Word.\n>"
    word1 <- getLine
    putStr "Please Enter a Second Word. \n>"
    word2 <- getLine
    print $ checkAnagram word1 word2

