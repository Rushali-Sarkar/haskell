makeReverse :: Eq a => [a] -> [a]
makeReverse x      | x == []   = []
makeReverse (x:xs) | otherwise = makeReverse xs ++ [x] 

makePalindrome :: Eq a => [a] -> [a]
makePalindrome x | x == []   = []
makePalindrome x | otherwise = x ++ reverse x
