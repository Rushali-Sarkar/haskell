in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x = x >= min && x <= max

in_range2 :: Integer -> Integer -> Integer -> Bool
in_range2 min max x = 
    let in_lower_bound = min <= x
        in_upper_bound = max >= x
    in
    in_lower_bound && in_upper_bound

in_range3 :: Integer -> Integer -> Integer -> Bool
in_range2 min max x = ilb && iub
    where
        ilb = min <= x
        ulb = max >= x

in_range4 :: Integer -> Integer -> Integer -> Bool
in_range4 min max x = 
    if ilb then ulb else False
    where
        ilb = min <= x
        ulb = max >= x

