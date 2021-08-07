errorHead :: [a] -> a 
errorHead [] = error "List is empty"
errorHead (x: xs) = x

errorTail :: [a] -> [a]
errorTail [] = error "List is empty"
errorTail (x: xs) = xs

safeTail :: [a] -> [a]
safeTail [] = []
safeTail (x: xs) = xs

safeHead :: [a] -> [a]
safeHead [] = []
safeHead (x: xs) = [x]


