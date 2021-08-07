splitString :: String -> [String]
splitString [] = []
splitString [x] = [x: "_"]
splitString (x: y: xs) = [x, y]: splitString xs

main = do
    print $ splitString "abcdef"
    print $ splitString "abcde"
