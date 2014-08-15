module Lwch005 where 
-- : retab 
-- : set +s 
-- [count]ge  
-- [count](
-- [count]{
--  set expandtab ts=4 ruler number spell linebreak


----------------
-- operators --
----------------
-- are also functions 
-- just surround them with () 
addOne x = (+) x 1  
{-
(>0) = (\x -> x > 0)
(2*) = (\x -> 2 * x)
(+1) = (\x -> x + 1)
(2^) = (\x -> 2 ^ x)
(^2) = (\x -> x ^ 2)
-}
-- functions can act as operators
-- use the ` "back-tick"
-- mod 11 2 
--  11 `mod` 2 

-- $ is short hand for ()
-- head(tail[1..11]) 
-- same as
-- head$tail[1..11]  


-------------------------
-- Partial application --
------------------------- 
foo x y z = x + y + z 
foo'= foo 1 3
-- :i foo' 1.1 

----------------------------
-- Higher Order Functions --
----------------------------
-- Functions as values
-- Functions taking functions as args
pass3 f =  f 3 
-- pass3 (+1)

compost f g x = f (g x) 
-- (+1) (*5) 2

-- :t const 
-- :t const 4  5.5

----------
-- map --
---------
-- map (/4) [1..11]
-- map (+1) (map (/4) [1..11])

------------
-- filter --
------------
-- filters out false 
-- leaves true 
------------------------
isEven x = x `mod` 2 == 0 
removeOdd = filter isEven 


----------
-- zip --
---------
-- zip ['a'..'z'] [1..]
myFun000 = zip ['a'..'z'] [1..] 

------------
-- fold ----
-----------
-- foldl (*) 2 [1..11]
-- foldr (*) 2 [1..11]
-- foldr (-) 0 [1..11]
-- foldl (-) 0 [1..11] 



