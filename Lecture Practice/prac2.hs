divider x y = div x y
divider' x y = x `div` y

taker x y = take x y
taker' x y = x `take` y

headList x = head x

tailList x  = tail x

myHead [] = []
myHead (x:_) = x

dropper x y = drop x y

myTake n xs = start
 where (start,end) = splitAt n xs

splitter x y = splitAt 2 y

takeEven y = takeWhile even y

dropEven y = dropWhile even y

succer y = map succ y

sqrter y = map sqrt y

gcder y = map (gcd 10) y

myGCD 0 b = b
myGCD a 0 = a
myGCD a b = gcd b r
    where (q, r) = a `divMod` b
    -- where (q, r) = divMod a b

filtEven x = filter even x
filtEven' x = [n | n <- [1..x], even n]

divisors n = filter (divides n) [2..(n `div` 2)]
  where divides a b = (a `mod` b) == 0

mySum [] = 0
mySum (x:xs) = x + mySum xs

mySum' xs = foldl (+) 0 xs

myLength xs = foldl oneMore 0 xs
    where oneMore n _ = n+1

myConcat xs = foldl (++) [] xs

myReverse xs = foldl prefix [] xs
    where prefix xs x = x:xs
  
myReverse' xs = foldr postfix [] xs
    where postfix x xs = xs ++ [x]

val :: Int
val = 6

lst :: [Int]
lst = [1,2,3]

lstlst :: [[Int]]
lstlst = [[1,2,3], [4,5]]

-- Int is 64bit and fast
-- Integer doesnt overflow but slow

base :: Int
base = 2

power :: Int
power = 64

base' :: Integer
base' = 2

power' :: Integer
power' = 64

half_of :: Float -> Float
half_of x = x/2

myPower :: Int -> Int -> Int
myPower _ 0 = 1
myPower x y = x * myPower x (y-1)

myLength' :: [Float] -> Int -- Can only accept the first type
myLength' xs = foldl oneMore 0 xs
    where oneMore n _ = n+1

myLength'' :: [a] -> Int -- Can accept any type
myLength'' xs = foldl oneMore 0 xs
    where oneMore n _ = n+1

flip_args :: (a -> b -> c) -> b -> a -> c
flip_args f x y = f y x

myAnd :: Bool -> Bool -> Bool
myAnd False _ = False
myAnd True a = a

theSame :: (Eq a) => a -> a -> Bool
theSame x y = x == y

increase :: (Num a) => a -> a
increase x = x + 2

sameAsSix :: Int -> Bool
sameAsSix = theSame 6

myConcat' :: [[a]] -> [a]
myConcat' xs = foldl (++) [] xs

myConcat'' :: [[a]] -> [a]
myConcat'' = foldl (++) []

divisors' n = filter (divides n) [2..(n `div` 2)]
  where divides a b = (a `mod` b) == 0

map_test :: (Fractional a) => [a] -> [a]
map_test x = map (2/) x

map_test2 :: (Num a) => [a] -> [a]
map_test2 x = map (2+) x

map_test3 :: (Num a) => [a] -> [a]
map_test3 x = map (2*) x

myDiv :: (Int, Int) -> Int
myDiv (n,d) = div n d

addFourThings :: (Num a) => a -> a -> a -> a -> a
addFourThings x y z w = x + y + z + w

curryDiv :: Int -> Int -> Int
curryDiv x y = (curry myDiv) x y

uncurryDiv :: (Int, Int) -> Int
uncurryDiv (x,y) = (uncurry div) (10,2)

myUncurry :: (a -> b -> c) -> (a, b) -> c
myUncurry f (x,y) = f x y

addPairwise :: Num a => [a] -> [a] -> [a]
addPairwise xs ys = map (uncurry (+)) (zip xs ys)

multPairwise :: Num a => [a] -> [a] -> [a]
multPairwise xs ys = map (uncurry (*)) (zip xs ys)

myReverse'' :: [a] -> [a]
myReverse'' xs = foldl (flip (:)) [] xs

addToEach :: Num a => a -> [a] -> [a]
addToEach n lst = map (\x -> x+n) lst

addToEach' :: Num a => a -> [a] -> [a]
addToEach' n lst = map addN lst
    where addN x = x+n