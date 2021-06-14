import Data.Time.Calendar
import Data.Time.Calendar.OrdinalDate

merge :: (Ord x) => [x] -> [x] -> [x]
merge x_empty [] = x_empty
merge [] empty_x = empty_x
merge (x:xn)(y:yn)
    | x < y = x : merge xn (y:yn)
    | x >= y = y : merge (x:xn) yn

-- https://wiki.haskell.org/How_to_work_on_lists

mergeSort :: (Ord x) => [x] -> [x]
mergeSort [] = []
mergeSort [x] = [x]
mergeSort xn = merge (mergeSort first) (mergeSort second)
 where  half = length(xn) `div` 2
        first = take half xn
        second = drop half xn

daysInYear :: Integer -> [Day]
daysInYear y = [jan1..dec31]
 where jan1 = fromGregorian y 1 1
        dec31 = fromGregorian y 12 31

isFriday :: Day -> Bool
isFriday x
    | snd (mondayStartWeek x) == 5 = True
    | otherwise = False

divisors :: Int -> [Int]
divisors n = [i | i <- [2..(n `div` 2)], n `mod` i == 0]

getDay (y,m,d) = d

isPrimeDay :: Day -> Bool
isPrimeDay n
    | divisors (getDay(toGregorian n)) == [] = True
    | otherwise = False

primeFridays :: Integer -> [Day]
primeFridays n = [i | i <- daysInYear n, isFriday i, isPrimeDay i]