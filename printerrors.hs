-- https://www.codewars.com/kata/56541980fa08ab47a0000040

getErrors :: String -> Int
getErrors colors | length colors == 0 = 0
getErrors colors | head colors `elem` ['n'..'z'] = 1 + (getErrors $ tail colors)
getErrors colors | otherwise = getErrors $ tail colors

printErrors :: String -> String
printErrors colors = show (getErrors colors) ++ "/" ++ show (length colors)

main = do
    colors <- getLine
    print $ printErrors colors
