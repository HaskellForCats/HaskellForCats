module HighOrdFun where 
-- : set expandtab ts=4 ruler number spell
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
  We can partially apply functions on the fly 
    only providing some of the necessary arguments initially. 
Lambda expressions 
  which are for generating in-line anonymous functions.
Function combination 
  which creates a new function assembled from other functions.

Functions are Values 
  either as arguments to other functions 
  or 
  created on the fly as needed.

Higher Order Functions
  take functions as arguments 
  return functions as values.
-}
-- FUNCTIONS AS VALUES --
mult2 :: Integer -> Integer
mult2 = (2*)
add1 :: Integer -> Integer
add1 = (+1) 
-- here f is a function take as an argument that then gets 
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
in Java all the arguments to a function must be applied in advance. 

int foo(int x, int y, int z) {
  return x + y + z;
} 
foo_1_2 = foo(1,2); 
-- foo Java here, must be called with three args. 
-----------------------------------------------}
foo :: Num a => a -> a -> a -> a
foo x y z = x + y + z 

foo' :: (Eq a, Eq a1, Num a, Num a1, Num a2) => a -> a1 -> a2 -> a2
foo' 1 2 = foo 1 2 
-- *HighOrdFun> foo' 1 2 3 
-- 6 

-- pass (value x) and (function f) = (function f) <- passes (value x)
pass :: t1 -> (t1 -> t) -> t
pass x f = f x 
-- passThree is built by partially applying the pass function; pass only gets one argument here, so it is a function with an argument that takes another argument. 
passThree :: (Integer -> t) -> t
passThree = pass 3 
--------------------------------------------------------------------------------
-- ARGUMENTS MUST BE GIVEN IN ORDER WHEN THEY ARE TO BE PARTIALLY EVALUATED !!!
-- ------------------------------------------------------------------------------

---------------
-- OPERATORS -- 
-- ------------
-- +,*,:,++ are operators 
-- (+),(*),(:),(++) ARE NOW JUST FUNCTIONS

-- *HighOrdFun> (+) 3 5
-- 8
{-
ghci> (*) 2 3 
6
ghci> 2 * 3 
6
ghci> (*2) 4
8

-}
-- operators get passed easily to Higher-Order-Functions.
pass_3_4 :: (Num a, Num a1) => (a -> a1 -> t) -> t
pass_3_4 f = f 3 4 

-- then passing in an operator as a function 
-- *HighOrdFun> pass_3_4 (+)
-- 7
-- we can define new operators for special cases 
(.+) :: (Num t, Num t1) => (t, t1) -> (t, t1) -> (t, t1)
(a,b) .+ (c,d) = (a + c, b + d) 
-- (a,b) is a pattern that matches a pair, (c,d) is another pair. a + c is summing both first elements.  b + d are the second elements summed.

-- --------------------------- 
-- OPERATORS PARTIALLY APPLIED --
-- --------------------------- 
plus1 :: Integer -> Integer
plus1 = (+) 1 
plus1' = (1+)
plus1'' = (+1)
----------------------------
{- FUNCTIONS AS OPERATORS --
 - -------------------------
ghci>mod 10 2
0
ghci>10 `mod` 2
0
ghci> 4 `div` 2 
2
ghci> div 4 2 
2
ghci> `div` 4 2 

<interactive>:7:1: parse error on input ``'
ghci> (`div`) 4 2 

<interactive>:8:7: parse error on input `)'
ghci> (`div`2) 4  
2
ghci> (2`div`) 4  
0
-- REMEMBER ` NOT ' OTHERWISE -- 
ghci>4 'div' 2

<interactive>:16:3:
    Syntax error on 'div'
---------------------------------}
-- MAP FUNCTION  -- 
-- ------------------------------
-- map traverses a list add applies a function to every element in the list. 
-- map :: (a -> b) -> [a] -> [b]
-- ghci> map length ["map","sure","is","fun"]
-- [3,4,2,3] 
-- PARTIALLY APPLIED FUNCTIONS WORK WELL 
-- ghci> map (1+) [1..11]
-- [2,3,4,5,6,7,8,9,10,11,12]
double :: [Integer] -> [Integer]
double = map (2*) 
-- double will combine these two functions but will need a list as an argument. 
-- ghci> double [1..11] 
-- [2,4,6,8,10,12,14,16,18,20,22]
------------
-- FILTER --
-- ---------
-- tests each list element and makes a new list with what it collects.
-- and note how our composite function fits the type of the one it calls  
-- ghci>:i null
-- null :: [a] -> Bool     -- Defined in `GHC.List'
notNull :: [a] -> Bool
notNull xs = not (null xs)
-- ghci> filter notNull ["","there","","we","","are"]
-- ["there","we","are"]
-- filter tests and then collects. 
isEven x = x `mod` 2 == 0 
removeOdd = filter isEven 
{-
 - 
isEven :: Integral a => a -> Bool 
removeOdd :: [Integer] -> [Integer]  

ghci>removeOdd [1..11]
[2,4,6,8,10]

-- using 
filter :: (a -> Bool) -> [a] -> [a]     -- Defined in `GHC.List'
map :: (a -> b) -> [a] -> [b]   -- Defined in `GHC.Base'
fst :: (a, b) -> a      -- Defined in `Data.Tuple'
snd :: (a, b) -> b      -- Defined in `Data.Tuple'
-- map says give me the second part of this list of tuples but only after 
-- filter using fst to test the fist part of the tuple and because filter will only take Trues that's all that comes back.  
ghci> map snd (filter fst [(True, 1),(False,7),(True,11)])
[1,11]

