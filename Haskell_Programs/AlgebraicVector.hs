-- file: ch03/AlgebraicVector.hs
-- x and y coordinaties or lengths

data Cartesian2D = Cartesian2D Double Double
    deriving (Eq, Show)

-- Angle and distance (magnitude)

data Polar2D = Polar2D Double Double
    deriving (Eq, Show)


