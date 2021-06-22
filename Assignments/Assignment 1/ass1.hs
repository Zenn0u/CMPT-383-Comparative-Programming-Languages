import RainbowAssign
import qualified Data.Map as Map
import Data.Maybe as Maybe

pwLength, nLetters, width, height :: Int
filename :: FilePath
pwLength = 8            -- length of each password
nLetters = 5            -- number of letters to use in passwords: 5 -> a-e
width = 40              -- length of each chain in the table
height = 1000           -- number of "rows" in the table
filename = "table.txt"  -- filename to store the table

pwReduce :: Hash -> Passwd
pwReduce hash_x = map toLetter (reverse (take pwLength (baseConv hash_y)))
 where
    hash_y = fromEnum hash_x
    baseConv hash_y = (hash_y `mod` nLetters) : (baseConv (hash_y `div` nLetters))

-- https://wiki.haskell.org/How_to_work_on_lists

rainbowTable :: Int -> [Passwd] -> Map.Map Hash Passwd
rainbowTable width pws = Map.fromList (typePair (pairHash width pws) pws)
 where
    pairHash 0 pws = map pwHash pws
    pairHash width pws = pairHash (width - 1) (map pwReduce (map pwHash pws))
    typePair x y = zip x y

generateTable :: IO ()
generateTable = do
  table <- buildTable rainbowTable nLetters pwLength width height
  writeTable table filename

test1 = do
  table <- readTable filename
  return (Map.lookup 0 table)

-- https://hackage.haskell.org/package/containers-0.4.0.0/docs/Data-Map.html

findPassword :: Map.Map Hash Passwd -> Int -> Hash -> Maybe Passwd
findPassword rtable width hash = do
  x <- findPwd rtable width hash
  checkFP x width hash

findPwd :: Map.Map Hash Passwd -> Int -> Hash -> Maybe Passwd
findPwd rtable width hash
  | width < 0 = Nothing
  | Map.lookup hash rtable == Nothing = findPwd rtable (width - 1) (pwHash (pwReduce hash))
  | otherwise = Map.lookup hash rtable

checkFP :: Passwd -> Int -> Hash -> Maybe Passwd
checkFP pswd width hash
  | width < 0 = Nothing
  | pwHash pswd == hash = Just pswd
  | otherwise = checkFP (pwReduce (pwHash pswd)) (width - 1) hash

test2 :: Int -> IO ([Passwd], Int)
test2 n = do
  table <- readTable filename
  pws <- randomPasswords nLetters pwLength n
  let hs = map pwHash pws
  let result = Maybe.mapMaybe (findPassword table width) hs
  return (result, length result)

main :: IO ()
main = do
  generateTable
  res <- test2 10000
  print res