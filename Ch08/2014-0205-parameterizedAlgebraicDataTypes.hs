module DconsTcons where
-- : set expandtab ts=2 ruler number spell -- daw
-- starting again from scratch 
------------------------------------------
-- Parameterized Algebraic DataTypes 
---------------------------------------
{-
-- so as not to create ambiguous references we have commented out the first part of this example. 

data Maybe a = Nothing | Just a 	-- Defined in `Data.Maybe' 

-- Maybe can't produce anything on it's own and must be coupled with a parameter to create something. 

*DconsTcons> let x = Nothing 
*DconsTcons> x
Nothing
*DconsTcons> :t x
x :: Maybe a
-} 
-- much like polymorphic functions work nice with parameterized types, so well that they aren't much use without each other. 

fromMaybe :: a -> Maybe a -> a 
fromMaybe defaultVal Nothing = defaultVal 
fromMaybe _ (Just x) = x 

-- this approximates the standard library of definition of a list. 
data List a = Empty | Cons a (List a) 


-- data Map k a = ... 

-- Parmeterized Types can Hold any values. 

