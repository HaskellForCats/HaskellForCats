module Feb02 where 

data Bool = False | True
-- pattern match the values 
nott False = True 
nott True  = False 

-- note that True is Identity for AND
False   `&_&` q = False 
True    `&_$` q = q 

-- note False is Identity here for OR
False   `|_|` q = q 
True    `|_|` q = True 

{-
data Bool = False | True 
data Season = Winter | Spring | Summer | Fall 
data Shape = Circle Float | Rectangle | Float 
data Exp = List Int | Add Exp Exp | Mul Exp Exp 
data List a = Nil | Cons a (List a) 
data Nat = Zero | Succ Nat 
data Tree a = Empty | Leaf a | Branch | (Tree a) (Tree a) 
data Maybe a = Nothing | Just a 
data Pair a b = Pair a b 
data Sum ab = Left a | Right b 
-}

