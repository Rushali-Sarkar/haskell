nextRow :: [Int] -> [Int]
nextRow row = zipWith (+) ([0] ++ row) (row ++ [0])

pascle :: [Int] -> [[Int]]
pascle = iterate nextRow

main = do
    row <- getLine
    print $ take (read row :: Int) $ pascle [1]
