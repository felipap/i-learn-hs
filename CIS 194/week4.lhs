
anonymous functions
> greaterThan100 :: [Integer] -> [Integer]
> greaterThan100 xs = filter (\x -> x > 100) xs -- the backlash is supposed to be a lambda wtf

these can have multiple args as well
> (\x y z -> [x, 2*y, 3*z]) 5 6 3

operator section:
> greaterThan100 xs = filter (>100) xs

> (>100) 102 -- True
> (100>) 102 -- False

> foo :: (b -> c) -> (a -> b) -> (a -> c)
> foo f g = \x -> f (g x)

foo is (.) and represents function composition (= f . g)
even (length (abc xs)) is equiv. to even . length . abc

> :t (x)
> (.) :: (b -> c) -> (a -> b) -> a -> c
where's the last pair of parenthesis?

all functions in Haskell take a single argument
> f :: Int -> Int -> Int
or
> f :: Int -> (Int -> Int)

(function arrows associate to the right)

while function application is left-associative, so
> f 3 2
is equiv. to
> (f 3) 2

Likewise,
> \x y z -> ...
is syntatic sugar for
> \x -> (\y -> (\z -> ...)) -- so, namespace?
and
> f x y z = ...
for
> f = \x -> (\y -> (\z -> ...))

"Real" two-args function:
> f'' :: (Int, Int) -> Int
> f'' (x,y) = 2*x+y

curry and uncurry convert between representations of two-args functions
> curry :: ((a,b) -> c) -> a -> b -> c
> curry f x y = f (x,y)

> uncurry :: (a -> b -> c) -> (a, b) -> c
> uncurry f (x,y) = f x y

Because functions in Hakell are curried, it's easy to partially apply args to
them.

# Wholemeal programming
> foobar :: [Integer] -> Integer
instead of
> foobar [] 	= 0
> foobar (x:xs) = 0
> 	| x > 3 	= (7*x + 2) + foobar xs
> 	| otherwise = foobar xs
write
> foobar = sum . map (\x -> 7*x + 2) . filter (>3)

# Folds... wtf?

> sum' :: [Integer] -> Integer
> sum' [] 		= 0
> sum' (x:xs) 	= x + sum' xs

> product' :: [Integer] -> Integer
> product' [] 		= 1
> product' (x:xs) 	= x * product' xs

> length' :: [Integer] -> Integer
> length' [] 		= 0
> length' (x:xs) 	= 1 + length' xs

let's abstract these three functions
> fold :: b -> (a -> b -> b) -> [a] -> b
> fold b _ [] 	= b
> fold b f x:xs = f x (fold b f xs)

> sum'' = fold 0 (+)
> product'' = fold 1 (*)
> length'' = fold 0 (1+)

in std Predule, fold is foldr








