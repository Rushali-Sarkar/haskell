absVal :: Integer -> Integer
absVal x = if (x > 0) then x else (negate x)

absv :: Integer -> Integer
absv x =
    case x > 0 of
        True -> x
        False -> negate x