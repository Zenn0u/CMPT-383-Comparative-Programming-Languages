half_of x = x/2

reverser x = reverse x

double_of x = x * 2

is_equal x y = x == y

is_different x y = x /= y

join_list x y = x ++ y

con_join x y = x : y : []

-- 3 : [4,5]	[3,4,5]
-- 2 : (3 : (4 : []))	[2,3,4]
-- 2 : 3 : 4 : []	[2,3,4]
-- "abc" ++ "def"	"abcdef"
-- 'a' ++ "bcd"	an error
-- "ab" ++ ['c', 'd']	"abcd"
-- 'a' : "bc"	"abc"
-- ['X', 'Y'] == "XY"	True

add_double x y = 2 * (x + y)

isBig x = x > 100

listify x y = [x, y]

-- Pattern Matching

myAnd False _ = False -- same as "myAnd False x = False" but doesnt matter what it is
myAnd True x = x

isZero 0 = True
isZero _ = False

myLength [] = 0
myLength (x:xs) = 1 + myLength xs -- myLength (_:xs) is also fine

listEqual [] [] = True
---------------------------------THIS-----------------------------
listEqual [] (_:_) = False
listEqual (_:_) [] = False
------------------------------------------------------------------
listEqual (x:xs) (y:ys) = x == y && listEqual xs ys
---------------------------------OR THIS--------------------------
-- listEqual _ _ = False -- Order matters dont put this before anything else
------------------------------------------------------------------

hasEvenLength [] = True     -- base case: length 0 is even
hasEvenLength [_] = False   -- base case: length 1 is odd
hasEvenLength (_:_:rest) = hasEvenLength rest

-- (a:tail) a list with at least one element
-- (a:b:tail) a list with at least two elements

-- (a:b:c)
-- [6,7,8,9] means a = 6, b = 7, c = [8,9]
-- ['a','b'] means a = 'a', b = 'b', c= []
-- "ab" means a = 'a', b = 'b', c = [] (== "")
-- [100] means no match


-- Conditionals 

mySignum x
  | x>0         = 1
  | x<0         = -1
  | otherwise   = 0

word n = case n of
    1 -> "one"
    2 -> "two"
    3 -> "three"
    _ -> "???"
-- the above function is same as below
word2 1 = "one"
word2 2 = "two"
word2 3 = "three"
word2 _ = "???"

wordWithX n = (case n of
  1 -> "one"
  2 -> "two"
  3 -> "three"
  _ -> "???") ++ "X"
-- OR 
wordWithX2 n = (word n) ++ "X"

describeList lst = "The list is " ++ case lst of
  _:_:_:_:_  -> "fairly long"     --  >= 4 elements (4 or more)
  _:_        -> "short"           --  >= 1 element (1 or more)
  []         -> "empty"

-- List Comprehensions

do_something x = [x+i| i <- [1..x]]

succer y = [succ c | c <- y]

firstSquares n = [ i*i | i <- [1..n] ]
firstEvenSquares n = [ i*i | i <- [1..n], even i]
firstEvenSquares' n = [ i*i | i <- [2,4..n]]

qs [] = []
qs (x:xs) = smaller ++ [x] ++ larger
  where smaller = qs [a | a<-xs, a<=x]
        larger = qs [a | a<-xs, a>x]

somePowers x = [x, sq x, sq (sq x)]
  where sq n = n*n

weirdCalc x = [y, y+1, y+2]
  where y = x * x * x *x

myPower _ 0 = 1
myPower x y = x * myPower x (y-1)

myPower' x y
  | y==0      = 1
  | even y    = half*half
  | odd y     = x*half*half
  where half = myPower' x (div y 2)

stupidAdder x 0 = x
stupidAdder x y = stupidAdder (x+1) (y-1) -- Tail recursive if everything is within the next recursion

stupidAdder' x y = 1 + stupidAdder' x (y-1) -- Not tail recursive because we have to add 1 after the base case

myPowerTailRec a _ 0 = a
myPowerTailRec a x y = myPowerTailRec (x*a) x (y-1) -- Tail Recursive myPower

factorial 0 = 1
factorial n = n * factorial (n-1)

factorial' n = factorialTailRec 1 n -- Tail Recursive
    where
    factorialTailRec a 0 = a
    factorialTailRec a n = factorialTailRec (n*a) (n-1)