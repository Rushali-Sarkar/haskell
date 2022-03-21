import Data.List

compareLength :: (Foldable t1, Foldable t2) => t1 a1 -> t2 a2 -> Ordering 
compareLength x y = compare (length x) (length y)

sortList :: (Foldable t) => [t a] -> [t a]
sortList x = sortBy compareLength x
