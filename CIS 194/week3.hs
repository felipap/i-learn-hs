
-- Generalizing lists (polymorphism)
data List t = E | C t (List t)
-- List t means List is parameterized by a type
lst1 :: List Int
lst1 = C 3 (C 5 (C 2 E))
lst2 :: List Char
lst2 = C 'x' (C 'y' (C 'z' E))

-- Polymorphic functions
filterList _ E = E
filterList p (C x xs)
	| p x 		= C x (filterList p xs)
	| otherwise = filterList p xs

-- :t filterList is filterList :: (t -> Bool) -> List t -> List t

mapList :: (a -> b) -> List a -> List b
mapList _ E 		= E
mapList f (C x xs) 	= C (f x) (mapList f xs)


-- Total & partial functions
[a] -> a -- type of head → must crash for empty lists, because no default value
-- could satisfy all types of lists
-- head is therefore known as a partial function

data Maybe a = Nothing | Just a

safeHead :: [a] -> Maybe a
safeHead [] 	= Nothing
safeHead (x:_) 	= Just x

-- If in some situations a condition is guaranteed, the types ought to reflect
-- the guarantee!

data NonEmptyList a = NEL a [a]
nelToList :: NonEmptyList a -> [a]
nelToList (NEL x xs) = x:xs

listToNel :: [a] -> Maybe (NonEmptyList a)
listToNel [] 		= Nothing
listToNel (x:xs) 	= Just $ NEL x xs

headNEL :: NonEmptyList a -> a
headNEL (NEL a _) = a

tailNEL :: NonEmptyList a -> [a]
tailNEL (NEL _ as) = as
