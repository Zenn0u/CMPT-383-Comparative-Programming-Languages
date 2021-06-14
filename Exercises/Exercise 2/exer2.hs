divisors :: Int -> [Int]
divisors n = [i | i <- [2..(n `div` 2)], n `mod` i == 0]

primes :: Int -> [Int]
primes n = [i | i <- [2..n], divisors i == []]

pythagorean :: Int -> [(Int, Int, Int)]
pythagorean n = [(i, j, z) | i <- [1..n], j <- [1..n], z <- [1..n], (i^2) + (j^2) == (z^2), i < j]

join :: String -> [String] -> String
join n m = foldl1 (myConcat) m 
    where
        myConcat i j = i ++ n ++ j

fact' :: Int -> Int
fact' n = foldl (*) 1 [2..n]

hailstone :: Int -> Int
hailstone x
    | even x = x `div` 2
    | otherwise = 3 * x + 1

hailLen :: Int -> Int
hailLen n = hailTail 0 n
  where
    hailTail a 1 = a
    hailTail a n = hailTail (a + 1) (hailstone n)