{-# LANGUAGE NPlusKPatterns #-}
module Ch7example where 
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
-- import Data.List 
import qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
import Data.Char 


-- import Debug.Trace
-------------------------------------------------------
--          HIGHER ORDER FUNCTIONS 
-----------------------------------------------------
-- Higher order functions in haskell are functions that take functions as arguments.
-- they are also functions that return other functions.  
-- A collection of functions can then be a Domain Specific Language (DSL)

-- eval :: Expr -> Integer
data Expr = WhatsIs Integer
          | Add Expr Expr
 


-- 7.1 -- 
twice :: (t -> t) -> t -> t
twice f x = f(f x) 
-- *Ch7ex>twice (*2)3 
-- 12
-- *Ch7ex> twice reverse [1,2,3]
-- [1,2,3]

-- 7.2 -- 
m1p :: (t1 -> t) -> [t1] -> [t]
m1p f xs = [f x |x <-xs] 
{-*Ch7ex> map (+10) [1..11]
[11,12,13,14,15,16,17,18,19,20,21]

*Ch7ex> map A.isDigit ['a','1','b','2'] 
[False,True,False,True]

*Ch7ex> map reverse ["abc","def","ghi"] 
["cba","fed","ihg"]

-- MAP is POLYMORPHIC so it can be applied to list of any type. 
-- MAP can be applied to itself as in NESTED lists. 
*Ch7ex> map (map (+1)) [[1,2,3],[4,5]]
[[2,3,4],[5,6]]

-}
-- map as recursion which is more verbose but easier to grok the inner workings 
m1p'          :: (t -> a) -> [t] -> [a]
m1p' f []     = [] 
m1p' f (x:xs) = f x:m1p' f xs 
-- *Ch7ex> m1p' reverse ["abc","def","ghi"] 
-- ["cba","fed","ihg"]

-- prop_m1p f xs = m1p f xs == map f xs 
-- f3lter :: (t -> Bool) -> [t] -> [t]
f3lter p xs  = [ x | x <- xs, p x] 

-- filt2r :: (a -> Bool) -> [a] -> [a]
filt2r p [] = [] 
filt2r p (x:xs)     | p x           = x : filt2r p xs 
                    | otherwise     = filt2r p xs 

-- *Ch7ex> f3lter odd [1..11] == filt2r odd [1..11] 
-- True
-- *Ch7ex> filt2r (/= ' ')"abc def ghi" 
-- "abcdefghi"

--------------------------------------
-- MAP + FILTER 
--------------------------------------
sumsqreven :: Integral a => [a] -> a
sumsqreven ns = sum(map(^2) (filter even ns)) 
-- *Ch7ex> sumsqreven [2..10] 
-- 220

--------------------------------------
-- SOME OTHER PRELUDE FUNCTIONS 
-------------------------------------
-- *Ch7ex> all even [2,4..10]
-- True

-- *Ch7ex> any odd [2,4..10] 
-- False

-- *Ch7ex>  takeWhile isLower  "abc def"
-- "abc"

-- 7.3 -- 
{- ---------- NOTE!---------------- 
the circle plus operator (+) = recursively defined operator in this example
-- f []     = v            
-- f (x:xs) = x (+) f xs   
------------------------------------}

-- m + 0  = m                  -- (0 is the indentity element for +)
-- m + n  = n + m              -- (communative property of + )
-- m + (n + k) = (m + n) + k   -- (associativity of +)



----------------------------------------------------------
--          FOLDR
--------------------------------------------------------
f4ldr :: (a -> b -> b) -> b -> [a] -> b
f4ldr f a [] = a 
f4ldr f a (x:xs) = f x (f4ldr f a xs)
-- *Ch7ex> map negate [1..5] 
-- [-1,-2,-3,-4,-5]

