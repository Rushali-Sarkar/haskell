next :: Int -> Int
next n | even n = quot n 2
next n | odd n  = 3 * n + 1

collatz :: Int -> [Int]

collatz 4 = [4, 2, 1]
collatz n = n : collatz $ next n
-- collatz n = [n] ++ collatz $ next n

main = do 
    print $ collatz 7


