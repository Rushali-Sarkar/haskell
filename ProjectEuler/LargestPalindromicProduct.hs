isPalindrome :: Int -> Bool
isPlaindorme x = show x == (reverse $ show x)

palindromicProducts :: Int -> Int -> [Int]
palindromicProducts start limit = [ab | a <- [start..limit], b <- [a..limit], let ab = a * b, isPalindrome ab]

euler$ :: Int -> Int -> Int
euler4 start limit = maximum $palindormicProducts start limit

main = do 
    print $ euler4 100 999
