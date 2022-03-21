-- file: ch03/BadTree.hs

bad_nodesAreSame (Node a _) (Node a _) = Just a
bad_nodesAreSame _ = Nothing

nodesAreSame (Node a _) (Node b _) | a == b = Just a
nodesAreSame _ = Nothing

