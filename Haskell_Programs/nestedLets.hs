-- file: ch03/NestedLets.hs

foo = let a = 1
    in let b = 2
    in a + b

bar = let x = 1
    in ((let x = "foo" in x), x)

quxx a = let a = "foo"
    in a ++ "eek!"


