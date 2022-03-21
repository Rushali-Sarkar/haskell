main = interact characterCount where characterCount input = show (sum [length each | each <- words input]) ++ "\n"
