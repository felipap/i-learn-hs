
-- Exercise 1

toDigits :: Integer -> [Integer]
toDigits n
	| n <= 0 	= []
	| otherwise = toDigits (div n 10) ++ [(mod n 10)]

toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)

-- Exercise 2

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (a:b:c) = [2*a,b] ++ doubleEveryOther(c)
doubleEveryOther (x:[]) = [2*x]

-- Exercise 3
sumDigits :: [Integer] -> Integer
-- sumDigits n = sum n
sumDigits [] = 0
sumDigits (a:b) = a + sumDigits b

-- Exercise 4

