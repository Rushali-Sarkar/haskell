import Data.List

data TwoDimensionPoint = TwoDPoint Double Double
    deriving (Eq, Ord, Show)

getX :: TwoDimensionPoint -> Double
getX (TwoDPoint x _) = x

getY :: TwoDimensionPoint -> Double
getY (TwoDPoint _ y) = y

compareLowerY :: TwoDimensionPoint -> TwoDimensionPoint -> Ordering
compareLowerY point1 point2 | getY point1 == getY point2 = compare (getX point1) (getX point2)
compareLowerY point1 point2 | otherwise                  = compare (getY point1) (getY point2)

angleBetweenPoints :: TwoDimensionPoint -> TwoDimensionPoint -> Double
angleBetweenPoints point1 point2 = (getX point1 - getX point2) / (getY point1 - getY point2)

sortLowerY :: [TwoDimensionPoint] -> [TwoDimensionPoint]
sortLowerY points = sortBy compareLowerY points

compareByAngle :: TwoDimensionPoint -> TwoDimensionPoint -> TwoDimensionPoint -> Ordering
compareByAngle point1 point2 point3  = compare (angleBetweenPoints point1 point2) (angleBetweenPoints point1 point2)

sortByAngle :: TwoDimensionPoint -> [TwoDimensionPoint] -> [TwoDimensionPoint]
sortByAngle point points = sortBy (compareByAngle point) points

angleFrequency :: TwoDimensionPoint -> [TwoDimensionPoint] -> [[(Double, TwoDimensionPoint)]]
angleFrequency point points = group ([((angleBetweenPoints point x), x) | x <- points])

removeSameAngles :: [[(Double, TwoDimensionPoint)]] -> [TwoDimensionPoint]
removeSameAngles groupedPoints = [snd (head x) | x <- groupedPoints, (length x) == 1]


pointsToConsider :: [TwoDimensionPoint] -> [TwoDimensionPoint]
pointsToConsider points = removeSameAngles (angleFrequency x xs) where
                            sortedPoints = sortLowerY points
                            x = head sortedPoints
                            xs = tail sortedPoints

data Directions = LeftTurn | RightTurn | StraightLine
    deriving (Eq, Ord, Show)

relationship :: TwoDimensionPoint -> TwoDimensionPoint -> TwoDimensionPoint -> Directions
relationship point1 point2 point3 | determinant > 0  = LeftTurn
                                  | determinant < 0  = RightTurn
                                  | determinant == 0 = StraightLine where
                                                        determinant = (getX point2 - getX point1) * (getY point3 - getY point1) - (getY point2 - getY point1) * (getX point3 - getX point1)

relationshipTriplets :: [TwoDimensionPoint] -> [Directions]
relationshipTriplets (x:y:z:xs) = [relationship x y z] ++ relationshipTriplets ([y] ++ [x] ++ xs)
relationshipTriplets (_:_)      = []

getGrahamPoints :: [TwoDimensionPoint] -> [TwoDimensionPoint]
getGrahamPoints points = sortByAngle (head (sortLowerY points)) (pointsToConsider points)

graham :: [TwoDimensionPoint] -> [TwoDimensionPoint]
graham (x:y:z:xs) | relationship x y z == LeftTurn = [x] ++ graham ([y] ++ [z] ++ xs)
graham _ = []
