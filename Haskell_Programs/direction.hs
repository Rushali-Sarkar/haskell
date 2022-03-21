data Directions = LeftTurn | RightTurn | StraightLine
    deriving (Show)

data TwoDimensionPoint = TwoDPoint Int Int
    deriving (Show)

getX :: TwoDimensionPoint -> Int
getX (TwoDPoint x _) = x

getY :: TwoDimensionPoint -> Int
getY (TwoDPoint _ y) = y

relationship :: TwoDimensionPoint -> TwoDimensionPoint -> TwoDimensionPoint -> Directions
relationship point1 point2 point3 | determinant > 0  = LeftTurn
                                  | determinant < 0  = RightTurn
                                  | determinant == 0 = StraightLine where
                                                        determinant = (getX point2 - getX point1) * (getY point3 - getY point1) - (getY point2 - getY point1) * (getX point3 - getX point1)

relationshipTriplets :: [TwoDimensionPoint] -> [Directions]
relationshipTriplets (x:y:z:xs) = [relationship x y z] ++ relationshipTriplets ([y] ++ [x] ++ xs)
relationshipTriplets (_:_)      = []
relationshipTriplets _          = []
