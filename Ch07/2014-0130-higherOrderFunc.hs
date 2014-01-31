module HighOrdFun where 
{-
functions in  languages like Java and C#,
  functions are more often seen as 
    a way of packaging instructions to organize and reuse code.
But in Haskell functions are central 
  and can be passed around 
   like other values. 
Higher Order Functions 
  take functions as arguments 
    and return functions as well.
This is perhaps the easiest way to manipulate lists.
  we can partially apply functions on the fly 
    only providing some of the necessary arguments initially. 
Lambda expressions 
  which are for generating in-line annonamous fucntions.
function combination 
  which creates a new function assembled from other functions.

Functions are Values 
  either as arguments to other functions 
  or 
  created on the fly as needed.

Higher Order Functions
  take functionas as arguements 
  return functions as values.
-}
-- FUNCTIONS AS VALUES --
mult2 :: Integer -> Integer
mult2 = (2*)
add1 :: Integer -> Integer
add1 = (+1) 
-- here f is a function take as an arguement that then gets 
-- three  passed to it.  
pass3 :: Num a => (a -> t) -> t
pass3 f = f 3 
-- *HighOrdFun> pass3 add1
-- 4
compose :: (t1 -> t) -> (t2 -> t1) -> t2 -> t
compose f g x = f (g x) 
-- *HighOrdFun>  compose add1 mult2 4 
-- 9
always7 :: Num a => t -> a
always7 x =7 
-- *HighOrdFun> always7 6
-- 7
always7' :: b -> Integer
always7' = const 7 
-- *HighOrdFun> always7' 6
-- 7
-- *HighOrdFun>  (const 7)5 
--  7
------------------------- 
-- PARTIAL APPLICATION -- 
------------------------
{- 
in java all the arguments to a junction must be applied in advance. 

int foo(int x, int y, int z) {
  return x + y + z;
} 
foo_1_2 = foo(1,2); 
-- foo java here, must be called with three args. 
-----------------------------------------------}
foo :: Num a => a -> a -> a -> a
foo x y z = x + y + z 
foo' :: (Eq a, Eq a1, Num a, Num a1, Num a2) => a -> a1 -> a2 -> a2
foo' 1 2 = foo 1 2 
-- *HighOrdFun> foo' 1 2 3 
-- 6

