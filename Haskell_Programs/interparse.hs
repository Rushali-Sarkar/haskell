interparse :: [Char] -> [[Char]] -> [Char]
interparse s x      |  x == []  = ""
interparse s (x:xs) | xs == []  = x
interparse s (x:xs) | otherwise = x ++ s ++ interparse s xs
