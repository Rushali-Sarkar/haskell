reverseList :: Eq a => [a] -> [a]
reverseList x      | x == []   = []
reverseList (x:xs) | otherwise = reverseList xs ++ [x]

isPalindrome ::Eq a => [a] -> Bool
isPalindrome x = x == reverseList x
