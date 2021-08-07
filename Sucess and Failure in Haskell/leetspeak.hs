substitute :: Char -> Char
substitute c =
    case c of
        'a' -> '4'
        'A' -> '4'
        'b' -> '8'
        'B' -> '8'
        'e' -> '3'
        'E' -> '3'
        'g' -> '9'
        'G' -> '9'
        'i' -> '1'
        'I' -> '1'
        'l' -> '1'
        'L' -> '1'
        'o' -> '0'
        'O' -> '0'
        'r' -> '2'
        'R' -> '2'
        's' -> '5'
        'S' -> '5'
        't' -> '7'
        'T' -> '7'
        'z' -> '2'
        'Z' -> '2'
        _   -> c

leetspeak :: String -> String
leetspeak word = map substitute word

main :: IO()
main = do
    word <- getLine
    print $ leetspeak word