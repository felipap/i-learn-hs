
x :: Int

-- normal comments
{- enclosed comment -}

x = x + 1

---------------------------

biggest, smallest :: Int
biggest = maxBound
smallest = minBound

---------------------------

reallyBig :: Integer
reallyBig = 2^(2^(2^(2^2)))

-- there's double too
d1, d2 :: Double
d1 = 4.3423
d2 = 6.2342e-4

-- and FLoat, and Bool, and Char
f :: Float
f = 3.2341

dbol :: Bool
dbol = False -- /True

c1, c2 :: Char -- Unicode
c1 = 'x'
c2 = 'ø'

s :: String
s = "Hello, Haskell!"

-- `` make into an infix operation
-- not, &&, || exist
-- ==, /=, >, <, <=, >= too

sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n-1)

-- otherwise is True
-- pairs!!
p :: (Int, Char)
p = (3, 'x')
sumPair :: (Int, Int) -> Int
sumPair (x,y) = x+y

-- multiple arguments
f :: Int -> Int -> Int -> Int
f x y z = x + y + z
ex17 = f 3 17 8

-- FUNCTIONS TAKE PRECEDENCE over infix operators
f 3 n+1 7 -- evals to (f 3 n) + (1 7)
f 3 (n+1) 7

-- lists
nums, range, range2 :: [Integer]
nums = [1,2,3,19]
range = [1..100]
range2 = [2,4..100]
-- haskell also has list comprehensions <3 :)
-- Strings are lists of characters (String is an abbreviation for [Char])

hello1 :: [Char]
hello1 = ['h', 'e', 'l', 'l', 'o']

-- or

hello2 :: String
hello2 = "hello"

-- constructing lists
ex20 = 2 : 3 : 4 : []
ex21 = [2,3,4] == 2 : 3 : 4 : []

-- generate list of hailstone iterations
hailstoneq :: Integer -> [Integer]
hailstone 1 = [1]
hailstone n = n : hailstoneq (hailstone n)

-- functions on lists
-- Compute the length of a list of Integers
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs
-- we don't want x, so we could've written intListLength (_:xs)

-- using pattens
sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = []
sumEveryTwo (x:[]) = [x]
sumEveryTwo (x:(y:zs)) = (x + y) : sumEveryTwo zs
-- or sumEveryTwo (x:y:zs)

-- combining functions

hailstoneLen :: Integer -> Integer
hailstonLen n = intListLength (hailstoneSeq n) - 1
