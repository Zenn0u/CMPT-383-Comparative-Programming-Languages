pascal :: Int -> [Int]
pascal 0 = [1]
pascal x = zipWith (+) ([0] ++ prev) (prev ++ [0])
 where 
     prev = pascal (x-1)

addPair :: (Int, Int) -> Int
addPair x = uncurry (+) x

-- https://hackage.haskell.org/package/base-4.15.0.0/docs/Data-List.html

withoutZeros :: (Num x, Ord x) => [x] -> [x]
withoutZeros x = filter (/= 0) x

-- https://en.wikibooks.org/wiki/Haskell/Understanding_monads/Maybe

findElt :: (Eq x, Ord x) => x -> [x] -> Maybe Int
findElt x [] = Nothing
findElt x (y:yn)
    | y == x = Just 0
    | otherwise = fmap ((+) 1) (findElt x yn)