-- file: ch01/wc.hs
-- line begining with "--" are comments.

main = interact wordCount where wordCount input = show (length (words input)) ++ "\n"
