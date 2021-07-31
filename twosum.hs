--https://www.codewars.com/kata/52c31f8e6605bcc646000082

findHalf :: [Int] -> Int -> Int -> Int
findHalf numbers index target | index >= length numbers = -1
findHalf numbers index target | numbers !! index == target = index
findHalf numbers index target | otherwise = findHalf numbers (index + 1) target

twoSum :: [Int] -> Int -> [(Int, Int)]
twoSum numbers target = [(index1, index2) | index1 <- [0..(length numbers) - 1], let possible_target = target - numbers !! index1, let index2 = findHalf numbers (index1 + 1) possible_target, index2 /= -1]

main = do
    print $ twoSum [1, 2, 3, 4] 4
