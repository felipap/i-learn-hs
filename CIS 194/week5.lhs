
Haskell's polymorphism is known as parametric

> f :: a -> a -> a
> f x y = x && y

won't work, because there's no guarantee that x y are bool
Haskell types are erased by the compiler, wtf?

So only f could only have two implementations:
> f x y = x
and
> f x y = y

----

> (==) :: Eq a 	=> a -> a -> Bool
> (<) :: Ord a 	=> a -> a -> Bool
> show :: Show a=> a a -> String

Num, Eq, Ord and Show are type classes: "type-class polymorphic"
Type classes are sets of types that have certain operations defined for them...

> class Eq a where
> 	(==) :: a -> a -> Bool
> 	(/=) :: a -> a -> Bool

Eq is declared to be a type class with a single parameter, a.
Any type which wants to be an instance of Eq must define two functions (==) and
(/=), with the indicated type signatures.

> data Foo = F Int | G Char
> instance E Foo where
> 	(F i1) == (F i2) = i1 == i2
> 	(G c1) == (G c2) = c1 == c2
> 	_ == _ = False
> 	foo1 /= foo2 = not (foo1 == foo2)

	 
