﻿{-# LANGUAGE NPlusKPatterns #-}
module Ch7ex where 
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
-- import Data.List 
import  qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
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

-- 7.2 -- 7:30 -- 
{------------ SECTIONS ------------------------
-- are a way to use operator + value as a function

(>0) = (\x -> x > 0) 
(2*) = (\x -> 2 * x) 
(+1) = (\x -> x + 1) 
(2^) = (\x -> 2 ^ x)
(^2) = (\x -> x ^ 2)

*Ch7ex> (>0) 4 
True

*Ch7ex> (2*) 5 
10

*Ch7ex> (\x -> 2 * x) 5
10
------------------------------------------------}

-- m1p :: (t1 -> t) -> [t1] -> [t]
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
-- map as recursion is more verbose but can be easier to see the inner workings 
-- m1p'          :: (t -> a) -> [t] -> [a]
m1p' f []     = [] 
m1p' f (x:xs) = f x:m1p' f xs 
-- *Ch7ex> m1p' reverse ["abc","def","ghi"] 
-- ["cba","fed","ihg"]
--------------------------------------------------
--     FILTER
--            only keeps what's true 
--------------------------------------------------
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
{- ---------- NOTE!---------------- 14:30
the circle plus operator (+) in this instance, 
stands for a recursively defined operator; 
which can be replaced with any other operator 
such as +, or *, or && etc. 
------------------------------------}

-- f []     = v             -- v is for value     
-- f (x:xs) = x (+) f xs    -- (+) can be + or * or &&, etc.

s5m     []       = 0 
s5m     (x:xs)   = x + sum xs 

pr4duct []       = 1 
pr4duct (x:xs)   = x * pr4duct xs 

anD     []       = True 
anD     (x:xs)   = x && and xs 





-- m + 0  = m                  -- (0 is the indentity element for +)
-- m + n  = n + m              -- (is the communative property of + )
-- m + (n + k) = (m + n) + k   -- (is associativity for +)



----------------------------------------------------------
--          FOLDR
--------------------------------------------------------
f4ldr :: (a -> b -> b) -> b -> [a] -> b
f4ldr f a [] = a 
f4ldr f a (x:xs) = f x (f4ldr f a xs)
-- *Ch7ex> map negate [1..5] 
-- [-1,-2,-3,-4,-5]

-- it is more helpful to think of fold none recursively. 
-- think of a function gobbling cons and  [] gets a value  
{-
*Ch7ex> sum [1,2,3] == foldr (+) 0 [1,2,3]
True
*Ch7ex>  foldr (+) 0 [1,2,3]== foldr (+) 0 (1:(2:3:[]))
True

NOTE!! THAT CONS BECOMES + AND [] BECOMES 1 

*Ch7ex> foldr (+) 0 (1:(2:3:[])) == 1+(2+(3+0))
True
*Ch7ex>  1+(2+(3+0)) == 6 
True

product :: Num a => [a] -> a

True
-}
prf_6 = (product [1,2,3] == foldr (*) 1 [1,2,3]) == (foldr (*) 1 (1:(2:(3:[]))) == 1*(2*(3*1))) 
-- True
l2ngth  xs      = sum [1|_<-xs]

-- remeber this bit of fun from  6.8.2.1 --
{-
length [1,2,3] 
= {applying length}
1+ length [2,3] 
= {applying length}
1+(1 + length [3])
= {applying length}
1 +(1+(1 + 0))
= {applying +}
3

-- proof -- 
*Ch7ex> length [1,2,3] == 1+ length [2,3]
True

*Ch7ex>  1+ length [2,3] == 1+(1 + length [3])
True

*Ch7ex>  1+(1 + length [3]) == 1 +(1+(1 + 0))
True

*Ch7ex> 1 +(1+(1 + 0)) == 3
True
-}

-- length :: [a] -> Int
-- reduxLength :: [a] -> Integer 
-- here we just map across and replace each element with 1 
-- fusing two functions defined as a fault.
reduxLength :: [a] -> Int
reduxLength = sum . map (\_ -> 1 )
{- proof --
*Ch7ex> length [1,2] == reduxLength [1,2]
Loading package array-0.4.0.1 ... linking ... done.
Loading package deepseq-1.3.0.1 ... linking ... done.
Loading package bytestring-0.10.0.2 ... linking ... done.
Loading package Win32-2.3.0.0 ... linking ... done.
Loading package old-locale-1.0.0.5 ... linking ... done.
Loading package time-1.4.0.1 ... linking ... done.
Loading package text-0.11.3.1 ... linking ... done.
Loading package random-1.0.1.1 ... linking ... done.
Loading package containers-0.5.0.0 ... linking ... done.
Loading package pretty-1.1.1.0 ... linking ... done.
Loading package template-haskell ... linking ... done.
Loading package QuickCheck-2.6 ... linking ... done.
Loading package attoparsec-0.10.4.0 ... linking ... done.
True 

foldr (\_ n -> 1 + n) 0


*Ch7ex> map (\x-> x + 3) [1,6,3,2]
[4,9,6,5]
*Ch7ex> map (+3) [1,6,3,2]
[4,9,6,5]
*Ch7ex> map (+3) [1,6,3,2] == map (\x-> x + 3) [1,6,3,2]
True

-} 
r2verse []          = [] 
r2verse (x:xs)      = r2verse xs ++ [x] 
{-
*Ch7ex> r2verse [1,2,3] == reverse [1,2,3]
Loading package array-0.f4.0.1 ... linking ... done.
Loading package deepseq-1.3.0.1 ... linking ... done.
Loading package bytestring-0.10.0.2 ... linking ... done.
Loading package Win32-2.3.0.0 ... linking ... done.
Loading package old-locale-1.0.0.5 ... linking ... done.
Loading package time-1.4.0.1 ... linking ... done.
Loading package text-0.11.3.1 ... linking ... done.
Loading package random-1.0.1.1 ... linking ... done.
Loading package containers-0.5.0.0 ... linking ... done.
Loading package pretty-1.1.1.0 ... linking ... done.
Loading package template-haskell ... linking ... done.
Loading package QuickCheck-2.6 ... linking ... done.
Loading package attoparsec-0.10.4.0 ... linking ... done.
True

*Ch7ex> r2verse [1,2,3] == r2verse (1:(2:(3:[])))
True
*Ch7ex> r2verse (1:(2:(3:[]))) == (([] ++ [3]) ++ [2]) ++ [1]
True
*Ch7ex> (([] ++ [3]) ++ [2]) ++ [1] == [3,2,1]
True

-- each (:) cons is replaced by (\x xs -> xs ++ [x]) and [] by []
and we could do this as a fold as well, because we just gather all the parts at one end which would be a list.
 


maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys
maximum' = foldr1 (\x acc -> if x > acc then x else acc)  
scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1] 
scanl (flip (:)) [] [3,2,1]
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1  
f $ x = f x  
map ($ 3) [(4+), (10*), (^2), sqrt] 
f . g = \x -> f (g x)  
-}

fn006 = foldr (\x_ n -> 1 + n) 0

 

{-
fn001 = map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] 
fn002 = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]  
fn003 = fn001 == fn002 
fn004 = map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]  
fn005 = map (negate . sum . tail) [[1..5],[3..6],[1..7]]  
-}
-- prf_lengthLambda :: (Eq a, Num a)=> [a] -> [a] -> Bool
-- prf_lengthLambda = length == foldr (\x_ n -> 1 + n) 0
-- No instance for (Eq ([a0] -> Int)) arising from a use of `=='
-- Possible fix: add an instance declaration for (Eq ([a0] -> Int))



-------------------------------------------------
--              PROOFINESS              -- 
---------------------------------------------------------
{-- AGLEBRA RULES -- 
--  these are all we need to rewrite any function 

x + 0 = x 
x * 1 = x
x + y = y + x 
x * y = y * x 
(x + y) + z = x + (y + z) 
(x * y) * z = x * (y * z) 
x * (y + z) = x * y + x * z 
-} 
{- 
using just these rules 
we can rewrite: 
  things that looks algebraic,
  addition 
  Propositional logic
  Set Theory 
  Program evaluation 
    Beta reduction? 

squares (x + y) == x * x + (2 * (x * y) + y * y) 
-- so as to not get into an infinite loop of swapping and swapping 
-- first goal is to get all ( ) on the right side of ==   
-- second goal is within ( ) we want to get vars in alphaNum order. 
-- then we will have a termination point. 
 
squares (x + y) =  x * x + (2 * (x * y) + y * y) 
-- Left side can be rewritten as: 
=
  squares (x + y)
=    
  (x + y) * (x + y)                        -- Distributive property
= 
  (x + y) * x + (x + y) * y                -- Commutative property
= 
  x * (x + y) + (x + y) * y                -- Commutative property
= 
  x * (x + y) + y * (x + y)                -- Distributive property
= 
  (x * x + x * y) + y * (x + y)            -- Distributive property
= 
  (x * x + x * y) + (y * x + y * y)        -- Associative  property
= 
  x * x + (x * y + (y * x + y * y))        -- Commutative property
=
  x * x + (x * y + (x * y + y * y))

-- right side can be rewritten as: 

  x * x + (2 * (x * y) + y * y) 
=
  x * x + ((1 + 1) * (x * y) + y * y)          -- Commutative property
= 
  x * x + ((x * y) * (1 + 1) + y * y)         -- Distributive property
=
  x * x + (((x*y) * 1 + (x*y) * 1) + y*y)     -- Identity 
  
= 
  x * x + ((x * y + (x * y) * 1) + y * y)      -- Identity 
= 
  x * x + ((x * y + x * y) + y * y)            -- Associative  property
= 
  x * x + (x * y + (x * y + y * y))  
-}


