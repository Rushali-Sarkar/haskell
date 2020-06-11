f  = cycle["", "", "FIZZ"]
b  = cycle["", "", "", "", "BUZZ"]
fb = zipWith (++) f b
pick word number = if null word then number else word
fizzbuzz = zipWith pick fb $ map show [1..]

main = do
    number <- getLine
    print $ take (read number :: Int) fizzbuzz
