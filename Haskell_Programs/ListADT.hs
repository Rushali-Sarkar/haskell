-- file: ch03/ListADT.hs

data List a = Cons a (List a) | Nil
    deriving (Show)

formList (x: xs) = Cons x (formList xs)
formList [] = Nil

deformList (Cons x xs) = x: deformList xs
deformList Nil = []
