minMax (h: t) = Just (foldr (\x (min, max) -> (if x < min then x else min, if x > max then x else max)) (h, h) t)
minMax _ = Nothing
