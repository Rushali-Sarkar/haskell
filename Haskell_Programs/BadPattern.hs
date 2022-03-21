-- file: ch03/BadPattern.hs

badExample (x: xs) = x + badExample xs
