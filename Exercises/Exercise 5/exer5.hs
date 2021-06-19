import Data.Ratio

-- http://zvon.org/other/haskell/Outputprelude/iterate_f.html

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : myIterate f (f x)

-- http://zvon.org/other/haskell/Outputprelude/splitAt_f.html
-- https://stackoverflow.com/questions/33661358/problems-with-understanding-splitat-in-haskell

mySplitAt :: Int -> [a] -> ([a],[a])
mySplitAt 0 y = ([], y)
mySplitAt _ [] = ([], [])
mySplitAt x (y:yn) = ((y:k), l)
 where (k, l) = mySplitAt (x-1) yn

rationalSum :: Integer -> [Rational]
rationalSum x = [(i % (x-i)) | i <- [1..(x-1)]]

rationalSumLowest :: Integer -> [Rational]
rationalSumLowest x = [(i % (x-i)) | i <- [1..(x-1)], gcd (x-i) i == 1]

-- https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-List.html#g:4

rationals :: [Rational]
rationals = concatMap rationalSumLowest [1..]

-- https://stackoverflow.com/questions/919937/convert-a-string-list-to-an-int-list/919947
 
readInt :: [String] -> [Int]
readInt = map read

-- http://zvon.org/other/haskell/Outputprelude/readFile_f.html
-- https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-String.html#v:words

sumFile :: IO ()
sumFile = do
    contents <- readFile "input.txt"
    print $ sum(readInt(words contents))