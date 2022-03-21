getLength :: [a] -> Int
getLength x      | null x = 0
getLength (x:xs) | otherwise = 1 + getLength xs
