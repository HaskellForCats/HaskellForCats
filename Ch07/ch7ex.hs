module Ch7ex where 
-- : set expandtab ts=4 ruler number spell
-- import Test.QuickCheck 
-- import Data.List 
import qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
import Data.Char 
-- higher order functions in haskell are functions that take functions as arguments. Since you can create a colletion of custom made functions that take other fuctions as their arguements it isn't far removed from creating a Domain Specific Language.
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

-- MAP is POLYMORPHIC so it can be applied to list of any type. MAP can be applied to itself as in NESTED lists. 
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
-- f []     = v 
-- f (x:xs) = x (�E%) f xs 
{- 
the circle plus operator 
is  used a recursively defined operator in this case

m + 0  = m  (0 is the indentity element for +)
m + n = n + m   (communative property of + )
m + (n + k) = (m + n) + k  (associativity of +)

the circle plus operator 
is  used a recursively defined operator. 
-}

----------------------------------------------------------
--          FOLDR
--------------------------------------------------------
f4ldr :: (a -> b -> b) -> b -> [a] -> b
f4ldr f a [] = a 
f4ldr f a (x:xs) = f x (f4ldr f a xs)
-- *Ch7ex> map negate [1..5] 
-- [-1,-2,-3,-4,-5]
f x = g 
     where 
     g y = x + y 
----------------------------------------------------------
--          CURRYING 
-- a function of two numbers is the same as 
-- a function of the first number that returns 
-- a function of the second number
(aDD x) y = x + y   
-- *Ch7ex> aDD 3 4
-- 7
--   (aDD 3) 4 
-- =
--   3 + 4 
-- = 
--   7
-- Haskell Curry (1900 - 1982) 
-- Moses Schonfinkel (1889-1942) His system was essentially equivalent to a combinatory logic based upon the combinators B, C, I, K, and S. Schönfinkel was able to show that the system could be reduced to just K and S and outlined a proof that a version of this system had the same His paper also showed that functions of two or more arguments could be replaced by functions taking a single argument. This replacement mechanism simplifies work in both combinatory logic and lambda calculus and would later be called currying, after Haskell Curry power as predicate logic
-- Gottlob Frege (1848 - 1925)
{------------------------------------------------
                       LAMBDA
BETA RULE 

   (\x -> e) d 
=
   let x = d in e


------------------------------------------------}
{----------------------------------------------
                   BINDINGS 
bindings occur              x = 2 
a bound occurence           y = x + 1
Scope of the binding        z = x + y * y
  is in y and z 
same is true of functions 
f x = g x (x+1) 
g x y = x + y * y 

g's x has nothing to do with f's x 
  that's why we can have (x:xs) all over and they don't clash  a variable in a function definition has a scope that is contained in the right hand side, g's x use case 
is only in the = (x + y * y) unless we call (g x) y 
 elsewhere. 
-- *Ch7ex> g 7 8 
--  71
FUNCTION Binding 
Formal Params -- the x xs 
Actual Params -- where they are applied 

f x = z 
    where 
    y = x + 1 
    z = x + y * y 

let f x = z  where ; y = x + 1 ; z = x +y * y 

-- Prelude> f 2 
-- 11


f x = g (x+1) 
      where 
      g y = x+y*y

-- Prelude> let f x = g (x+1) where ;  g y = x+y*y
-- Prelude> f 2
-- 11
x has scope all the way down to the where clause
y has scope only down in the where clause 
------------------------------------------------} 
 

-- QUICKCHECK EXAMPLES -- 
square x  = x * x 
pyth a b  = square a + square b 
prop_square x = square x >=0   
prop_squares x y = 
    square (x+y) == square x + 2*x*y +square y 
prop_pyth x y = 
    square (x+y) == pyth x y + 2*x*y 
{-
*Ch7ex> quickCheck prop_square
+++ OK, passed 100 tests.
*Ch7ex> quickCheck prop_squares
+++ OK, passed 100 tests.
*Ch7ex> quickCheck prop_pyth
+++ OK, passed 100 tests.
-}

{-----------------------------------------------------
--               important MATH PROPERTIES 
--                  associativity
                     identity
                     distributivity
                      zero 
                     idempotence
-----------------------------------------------------
associativity If a binary operation is associative, repeated application of the operation produces the same result regardless how valid pairs of parenthesis are inserted in the expression 
identity In algebra, an identity or identity element of a set S with a binary operation is an element e that, when combined with any element x of S, produces that same x. 
commutativity In mathematics, a binary operation is commutative if changing the order of the operands does not change the result.
distributivity 
zero 
idempotence  is the property of certain operations in mathematics and computer science, that can be applied multiple times without changing the result beyond the initial application.
---------------------------------------------------------------}

