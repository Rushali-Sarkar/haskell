nextCollatz :: Int -> Int
nextCollatz number | even number = quot number 2
nextCollatz number | otherwise   = 3 * number + 1

collatzSequence :: Int -> [Int]
collatzSequence 4 = [4, 2, 1]
collatzSequence 1 = [1, 4, 2, 1]
collatzSequence number = number : (collatzSequence $ nextCollatz number)

main = do
    number <- getLine
    print $ collatzSequence (read number :: Int)
