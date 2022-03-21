getlength :: Eq a => [a] -> Int
getlength x      | x == []   = 0
getlength (_:xs) | otherwise = 1 + length xs

getsum :: (Eq p, Num p) => [p] -> p
getsum x      | x == []   = 0
getsum (x:xs) | otherwise = x + sum xs

getmean :: (Fractional a1, Integral a2) => [a2] -> a1
getmean x = (fromIntegral (getsum x)) / (fromIntegral (getlength x))
