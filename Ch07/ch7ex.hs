module Ch7ex where 
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
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



-}{----------------------------------------------
            BINDINGS + ONE LINERS
---------------------------------------------- 
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
g is scoped only to the body of the function 

f x = f (x+1) 
     where 
     f y = x + y * y 

-- *Ch7ex> let f x = f (x+1) where; f y = x+y*y  
-- *Ch7ex> f 2 
--  11

note that the where contains the second f entirely 

f x = g (x+1) 
      where 
      g y = x + y * y 

-- *Ch7ex> let f x = g (x+1) where; g y = x + y * y 
-- *Ch7ex> f 2
-- 11

x has meaning only where the function is applied 

(N where x  = M) = (\x.N) M 
lambda x with body N 

(M where f x = M) = (M where f = \x.N)

f 2 
where 
f x = x + y * y 
     where 
     y = x + 1 
= 
f 2 
where 
f = \x -> (x+y*y where y = x+1)
=
f2 
where 
f = \x -> ((\y -> x + y * y) (x+1))
= 
(\f -> f 2) (\x -> ((\y -> x+y*y) (x+1)))

(\f -> f 2) (\x -> ((\y -> x + y * y) (x+1)))
=
(\x -> ((\y -> x + y * y) (x +1))) 2 
=
(\y -> 2+y*y) (2+1) 
= 
(\y -> 2+y*y) 3 
= 
2 + 3 * 3 
= 
11

LAMBDA EXPRESSIONS ARE NOT RECURSIVE !!! 
one big reason, because they are anonymous 
and can't be called by name.
 
------------- SECTIONS ------------------------
are a way to use operator + value as a function
(>0) = (\x -> x > 0) 
(2*) = (\x -> 2 * x) 
(+1) = (\x -> x + 1) 
(2^) = (\x -> 2 ^ x)
(^2) = (\x -> x ^ 2)

*Ch7ex> (2*) 5 
10
*Ch7ex> (\x -> 2 * x) 5
10

-----------------------------------------------}
f1 xs = foldr (+) 0 
         (map (\x -> x * x) 
           (filter (\x -> x > 0) xs))

f2 xs = foldr (+) 0 (map (^2)(filter (>0) xs))
-- *Ch7ex> f [1.11]
-- 1.2321000000000002
{----------------------------------------------
--         COMPOSITION 
----------------------------------------------
(.) :: (t1 -> t) -> (t2 -> t1) -> t2 -> t
(f.g) x = f (g x) 

pos x = x > 0  
spr x = x * x 

Normally, we make a lambda with the sole purpose of passing it to a higher-order function. 
-----------------------------------------------}
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n*3 + 1)  
 
numLongChains = length (filter isLong (map chain [1..100]))  
    where 
     isLong xs = length xs > 15  

n5mLongChains :: Int
n5mLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))  
--  (where; isLong xs = length xs > 15) is swapped for (\xs -> length xs > 15) 

-- QUICKCHECK EXAMPLES -- 

square x  = x * x 

squares_prop x y = square (x +y) == x * x + 2 * x * y + y * y 
{- *Ch7ex> quickCheck prop_squares 
Loading package array-0.4.0.1 ... linking ... done.
Loading package deepseq-1.3.0.1 ... linking ... done.
Loading package bytestring-0.10.0.2 ... linking ... done.
Loading package text-0.11.3.1 ... linking ... done.
Loading package old-locale-1.0.0.5 ... linking ... done.
Loading package time-1.4.0.1 ... linking ... done.
Loading package random-1.0.1.1 ... linking ... done.
Loading package containers-0.5.0.0 ... linking ... done.
Loading package attoparsec-0.10.4.0 ... linking ... done.
Loading package pretty-1.1.1.0 ... linking ... done.
Loading package template-haskell ... linking ... done.
Loading package QuickCheck-2.6 ... linking ... done.
+++ OK, passed 100 tests.
-}

pyth a b  = square a + square b 
prop_square x = square x >=0   
prop_squares x y = 
    square (x+y) == square x + 2*x*y +square y 
prop_pyth x y = 
    square (x+y) == pyth x y + 2*x*y 


{--     RESULTS
*Ch7ex> quickCheck prop_square
+++ OK, passed 100 tests.
*Ch7ex> quickCheck prop_squares
+++ OK, passed 100 tests.
*Ch7ex> quickCheck prop_pyth
+++ OK, passed 100 tests.
-}

{-------------------------------------------------------
--                   -- PROOFS --   
--------------------------------------------------------
proofs are generally stronger than tests, 
because no matter how many tests we preform, 
there will be edge cases that must be accounted for.

Proofs take testing to the next level, 
and functional programming can take advantage of that; 
for once something is proved for a function, 
it has passed and will always pass all tests.
 
Computers are literal minded; 
they only understand only what they are given. 
Constructing a proof on a computer seems like a natural; 
where as logicians can be tripped up with their own clever sematics,
computors can't.
 
Symbolic Manipulation is something computers can do well, 
espcially where there arn't ambiguities. 


4195835 / 3145727 = 1.333820449136241002

The Pentium FDIV bug was a bug in the Intel P5 Pentium floating point unit (FPU). Because of the bug, the processor would return incorrect results for many calculations used in math and science. Intel blamed the problem on a few missing entries in the lookup table used by the company. The cost of the recall, 1/2 billion dollars in write offs. 
it returned only 1.333

Leibniz:  
Indiscernability of Identity 
Idenity of Indiscernables
Equality is relexive: x = x 
Equals may be substituted for equals. 

yet in java you can happily write: 
i++ != i++ 

In Haskell equals may be substituted for equals just about everywhere. 
This is one reason why functions are easier to reason about than objects.

square' x  = x * x 

squares_prop' x y = square' (x + y) == x * x + 2 * x * y + y * y 

-- *Ch7ex> quickCheck squares_prop'
-- +++ OK, passed 100 tests.

-- AGLEBRA RULES -- 

x + 0 = x 
x * 1 = x
x + y = y + x 
x * y = y * x 
(x + y) + z = x + (y + z) 
(x * y) * z = x * (y * z) 
x * (y + z) = x * y + x * z 

using just these rules 
we can rewrite: 
  things that looks algebraic,
  addition 
  Propositional logic
  Set Theory 
  Program evaluation 
    Beta reduction? 

  squares (x + y) == x * x + (2 * (x * y) + y * y) 
-- so as to not get into an infite loop of swapping and swapping 
-- first goal is to get all ( ) on the right side of ==   
-- second goal is within ( ) we want to get vars in alphaNum order. 
-- then we have a termination point. 
 
  squares (x + y) =  x * x + (2 * (x * y) + y * y) 
-- Left side can be rewritten as: 
=
  squares (x + y)
=    
  (x + y) * (x + y)                                -- Distrib rule
= 
  (x + y) * x + (x + y) * y                        -- Commutative property
= 
  x * (x + y) + (x + y) * y                        -- Commutative property
= 
  x * (x + y) + y * (x + y)                        -- Distributive property
= 
  (x * x + x * y) + y * (x + y)                    -- Distributive property
= 
  (x * x + x * y) + (y * x + y * y)                -- Associative  property
= 
  x * x + (x * y + (y * x + y * y))                -- Commutative property
=
  x * x + (x * y + (x * y + y * y))

-- right side can be rewritten as: 


-----------------------------------------------------}


{-----------------------------------------------------
          important MATH PROPERTIES 
                    associativity
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

