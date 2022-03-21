-- file: ch03/BogousPattern.hs

data Fruit = Apple | Orange
    deriving (Eq, Show)

apple = "apple"
orange = "orange"

whichFruit :: String -> Fruit
whichFruit f = case f of
    "apple" -> Apple
    "orange" -> Orange

equational apple = Apple
equational orange = Orange
