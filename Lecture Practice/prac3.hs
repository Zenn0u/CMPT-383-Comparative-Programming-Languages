--import Control.Parallel
--import Control.Parallel.Strategies
import System.Random

myPowerTailRec, myPowerTailStrict :: Int -> Int -> Int -> Int

myPowerTailRec a _ 0 = a
myPowerTailRec a x y = myPowerTailRec (x*a) x (y-1)

myPowerTailStrict a _ 0 = a
myPowerTailStrict a x y = (myPowerTailStrict $! (a*x)) x (y-1)
-- $! forces strict evaluation instead of default lazy evaluation of haskell

myPowerSeq a _ 0 = a
myPowerSeq a x y = seq newacc (myPowerSeq newacc x (y-1))
    where newacc = a*x
-- seq function also forces stric evalution

myPowerSeq' :: Int -> Int -> Int
myPowerSeq' x y = myPowerTailSeq 1 x y
 where
     myPowerTailSeq :: Int -> Int -> Int -> Int
     myPowerTailSeq a _ 0 = a
     myPowerTailSeq a x y = seq newacc (myPowerTailSeq newacc x (y-1))
      where newacc = a * x

myPowerFoldr x y  = foldr (*) 1 xs
 where xs = take y (repeat x)

myPowerFoldl x y = foldl (*) 1 xs
 where xs = take y (repeat x)

--myPowerFoldl' x y = foldl' (*) 1 xs
 --where xs = take y (repeat x) 

-- divisors x = [i | i <- [1..x], x `mod` i == 0]

--funnyDivisors n   = map pred (divisors (n*2))
--funnyDivisors' n  = map pred $ divisors $ n*2
--funnyDivisors'' n = (map pred) . divisors . (*2) $ n
--funnyDivisors'''  = (map pred) . divisors . (*2)

mySum xs = foldl (+) 0 xs

-- Concurrent Programming

-- calculation i = myPowerSeq i 1 n
--slowCalc i = myPowerSeq i 1 (n `div` 50)
--fastCalc i = myPowerSeq i 1 (n `div` 500000)

-- calcA = a + b
--     where a = calculation 1
--           b = calculation 2

-- calcB = (a `par` b) `pseq` (a + b)
--     where a = calculation 1
--           b = calculation 2

--calcC = map slowCalc [0..100]

--calcD = parMap rseq slowCalc [0..100]

--calcE = map fastCalc [0..1000000]

--calcF = parMap rseq fastCalc [0..1000000]

listOfThree :: Int -> [Int]
listOfThree x = [x, x, x]

secondLine :: IO String
secondLine = getLine >>= (\line1 -> (getLine >>= (\line2 -> (return line2))))

secondLine' :: IO String
secondLine' = do
    line1 <- getLine
    line2 <- getLine
    return line2

secondLine'' :: IO String
secondLine'' = getLine >>= step2
 where
     step2 line1 = getLine >>= (\line2 -> (return (line2)))

-- Same as above
secondLine''' :: IO String
secondLine''' = do
    line1 <- getLine
    getLine

succInput :: IO ()
succInput = do
    text <- getLine
    let succtext = map succ text
    putStrLn succtext

succInput' :: IO ()
succInput' = do
    text <- getLine
    succtext <- return $ map succ text
    putStrLn succtext    

threeRand :: [Int]
threeRand = 
    let gen0 = mkStdGen 1234 -- gen0 :: StdGen
        (rand0, gen1) = randomR (1, 100) gen0
        (rand1, gen2) = randomR (1, 100) gen1
        (rand2, _)    = randomR (1, 100) gen2
    in [rand0, rand1, rand2]

threeRand' :: IO [Int]
threeRand' = do
    gen0 <- newStdGen
    let
        (rand0, gen1) = randomR (1, 100) gen0
        (rand1, gen2) = randomR (1, 100) gen1
        (rand2, _)    = randomR (1, 100) gen2
    return [rand0, rand1, rand2]

threeRand'' :: IO [Int]
threeRand'' = do
    gen0 <- newStdGen
    return $ take 3 $ randomRs (1, 100) gen0


-- generate n random integers
randInts :: Int -> Int -> Int -> IO [Int]
randInts n minval maxval = do
    gen <- newStdGen
    return $ take n $ randomRs (minval, maxval) gen

-- convert a list of values into a histogram
histogram :: (Enum a, Eq a, Ord a) => [a] -> [String]
histogram vals = bars
    where
    counts = [length $ filter (==i) vals
             | i <- [(minimum vals)..(maximum vals)]]
    bars = [take n $ repeat 'X' | n <- counts]

-- print histogram of randomly-generated values
printHisto :: IO ()
printHisto = do
    vals <- randInts 1000 1 20
    let bars = histogram vals
    mapM_ putStrLn bars