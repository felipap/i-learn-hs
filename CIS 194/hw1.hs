
-- Exercise 1

toDigits :: Integer -> [Integer]
toDigits n
	| n <= 0 	= []
	| otherwise = toDigits (div n 10) ++ [(mod n 10)]

toDigitsRev :: Integer -> [Integer]
toDigitsRev n = reverse (toDigits n)

-- Exercise 2

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther (a:b:c) = (if (mod (length c) 2) == 0 then [2*a, b]
	else [a, 2*b]) ++ doubleEveryOther(c)
doubleEveryOther (x:[]) = [x]
doubleEveryOther [] = []

-- Exercise 3
sumDigits :: [Integer] -> Integer
sumDigits [] = 0
sumDigits (a:b) = sum (toDigits a) + sumDigits b

-- Exercise 4
validate :: Integer -> Bool
validate n = if (sumDigits (doubleEveryOther (toDigits n)) `mod` 10) == 0
	then True
	else False

-- Exercise 5
type Peg = String
type Move = (Peg, Peg)
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 a b _ = [(a, b)]
hanoi n a b c = (hanoi (n-1) a c b) ++ [(a,b)] ++ (hanoi (n-1) c b a)
