module Main where

import Data.Char

checkPasswordLength :: String -> Maybe String
checkPasswordLength password = 
  case (length password > 20) of
    True -> Nothing
    False -> Just password

requireAlphaNum :: String -> Maybe String
requireAlphaNum xs = 
  case (all isAlpha xs) of
    False -> Nothing
    True -> Just xs

cleanWhiteSpace :: String -> Maybe String
cleanWhiteSpace "" = Nothing
cleanWhiteSpace (x:xs) = 
  case (isSpace x) of
    True -> cleanWhiteSpace xs
    False -> Just (x:xs)


validatePassword :: String -> String
validatePassword password = 
  case (checkPasswordLength password) of
    Nothing -> "The password is more than 20 characters long"
    Just password -> 
      case (requireAlphaNum password) of
        Nothing -> "The password cannot contain any specail character other than alphabets"
        Just password -> "The password is valid"

main :: IO ()
main = do
  putStr "Please enter password\n>"
  password <- getLine
  print $ validatePassword password