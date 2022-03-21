-- file: ch03/Tree.hs

data Tree a = Node a (Tree a) (Tree a) | Empty
    deriving (Show)

simpleTree = Node "parent" (Node "left child" Empty Empty) (Node "right child" Empty Empty)

data NewTree a = NewNode a (Maybe (NewTree a)) (Maybe (NewTree a))
    deriving (Show)

getHeight Empty               = 0
getHeight (Node _ left right) = if leftHeight >= rightHeight
                                then leftHeight
                                else rightHeight where
                                    leftHeight  = 1 + getHeight left
                                    rightHeight = 1 + getHeight right
