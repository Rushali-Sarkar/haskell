module Main where

import Data.Char

checkPasswordLength :: String -> Maybe String
checkPasswordLength password = 
  case (length password > 20) of
    True -> Nothing
    False -> case (length password < 4) of
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


-- validatePassword :: String -> Maybe String
-- validatePassword password = 
--   case (cleanWhiteSpace password) of
--     Nothing -> Nothing
--     Just password2 -> 
--       case (requireAlphaNum password2) of 
--         Nothing -> Nothing
--         Just password3 -> 
--           case (checkPasswordLength password3) of
--             Nothing -> Nothing
--             Just password4 -> password4

-- Infix operator is same as nesting but without the need for
-- human to think through the positions of parantheses
-- and the number of layers

-- We cannot use the infix function composition operator 
-- (.) because it will take
-- one of another

-- Behold here comes our monad
-- m a gets passed to a function that needs just a input
-- > symbol we have to use something from ord class

validatePassword :: String -> Maybe String
validatePassword password = 
  cleanWhiteSpace password >>= requireAlphaNum >>= checkPasswordLength


main :: IO ()
main = do
  putStr "Please enter password\n>"
  password <- getLine
  print $ validatePassword password