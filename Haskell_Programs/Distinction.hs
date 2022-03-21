--file: ch03/Distinction.hs

a = ("Porpoise", "Grey")
b = ("Table", "Oak")

data Cetacean = Cetacean String String
    deriving (Show)

data Furniture = Furniture String String
    deriving (Show)

c = Cetacean "Porpoise" "Grey"
d = Furniture "Table" "Oak"
