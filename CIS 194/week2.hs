
-- haskell allows programmers to create their own enumaterion types

data Thing = Shoe
		   | Ship
		   | SealingWax
		   | Cabbage
		   | King
	deriving Show
	{- "magic incantation which tells GHC to gen default code to
	 - convert Things to Strings, for printing" (wtf?) -}

shoe :: Thing
shoe = Shoe

listO'Things :: [Thing]
listO'Things :: [Shoe, SealingWax, King, Cabbage, King]

-- we can write functions on Things:
isSmall :: Thing -> Bool
isSmall Shoe = True
isSmall Ship = False
isSmall SealingWax = True
isSmall Cabbage = True

-- or, shorter...
isSmall2 :: Thing -> Bool
isSmall2 Ship = False
isSmall2 King = False
isSmall2 _ = True

-- "Beyond enumerations"

data FailableDouble = Failure 	-- of type FailableDouble
					| OK Double -- takes a Double and returns a FailableDouble
	deriving Show

safeDiv :: Double -> Double -> FailableDOuble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

failureToZero :: FailableDouble -> DOuble
failureToZero Failure = 0
failureTOZero (OK d) = d

-- more than one argument...
-- store person's name, age, and favourite Thing
data Person = Person String Int Thing
	deriving Show

-- type constructor and data constructor are the same, but inhabit different
-- namespaces

brent :: Person
brent = Person "Brent" 31 SealingWax

getAge :: Person -> Int
getAge (Person _ a _) = a

-- types must start with uppercase letters, variables with lowercase

-- _ → wildcard pattern
-- matching like x@(Type a b c) allows x to represent the whole
-- patterns can be nested

ex03 = case "Hello" of
		[] -> 3
		('H':s) -> length s
		_ -> 7

-- recursive data types
data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x l) = x * intListProd l

-- as a tree
data Tree = Leaf Char | Node Tree Int Tree
tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))
