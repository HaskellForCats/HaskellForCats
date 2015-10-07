module Jan22MoreRec where 
-- import Data.Char
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
{- Most everything in Haskell is a function. If it isn't data. 

 Church of Recursion
Recursion gets you everything you would want just as well as a Turing Machine 

a recursive definition of a list
    it's either null as in [] 
    or 
    constructed as in x:xs 
        with head x an element and tail xs as a list
            that we can then apply head to get x until 
                the xs = empty

FIRST IS CLEAR AND UNDERSTANDABLE 
THEN AND ONLY THEN SHOULD IT BE FASTER

Conditionals are required if wet want to do interesting stuff.
More Conditionals means, each branch requires testing in itself.

operator properties that matter: 
associativity If a binary operation is associative, repeated application of the operation produces the same result regardless how valid pairs of parenthesis are inserted in the expression 
identity In algebra, an identity or identity element of a set S with a binary operation • is an element e that, when combined with any element x of S, produces that same x. 
commutativity In mathematics, a binary operation is commutative if changing the order of the operands does not change the result.
distributivity 
zero 
idempotence  is the property of certain operations in mathematics and computer science, that can be applied multiple times without changing the result beyond the initial application.

-}
prop_sum :: Integral a => a -> Property
prop_sum n = n >= 0 ==> sum [1..n] == n * (n + 1) `div` 2 
{- *Jan22MoreRec> quickCheck prop_sum
Loading package array-0.4.0.1 ... linking ... done.
Loading package deepseq-1.3.0.1 ... linking ... done.
Loading package bytestring-0.10.0.2 ... linking ... done.
Loading package Win32-2.3.0.0 ... linking ... done.
Loading package old-locale-1.0.0.5 ... linking ... done.
Loading package time-1.4.0.1 ... linking ... done.
Loading package random-1.0.1.1 ... linking ... done.
Loading package containers-0.5.0.0 ... linking ... done.
Loading package pretty-1.1.1.0 ... linking ... done. 
Loading package template-haskell ... linking ... done.
Loading package QuickCheck-2.6 ... linking ... done.
-} 
-- Associativity Left vs Right 
-- (x*x)*x) vs (x*(x*x) 
--
-- SEQUENTIAL takes 7 steps which mean m lists it takes m - 1 steps
--      xs1 +  (xs2 + (xs3 + (xs4 + (xs5 + (xs6 + (xs7 + xs8))))))
--
-- PARALLEL  takes 3 steps  
--      ((xs1 + xs2) + (xs3 + xs4)) +  ((xs5 + xs6) + (xs7 + xs8))
-- 
-- if we have m lists it takes log2m steps 
-- when m = 1000 sequential  takes a hundred times longer than parallel 
--}

en5nFromTo m n  | m > n     = [] 
                | m <= n    = m : en5nFromTo (m+1) n 

{- the recursion call moves toward the smaller, reducing the distance between start point and end point.

    en5nFromTo 1 3 
=
    1: en5nFromTo 2 3 
=
    1 : (2 : en5nFromTo 3 3) 
= 
    1: (2 : (3 : en5nFromTo 4 3)
= 
    1 : (2 : (3 [])) 
= 
    [1,2,3] 
-}
factorial n = product [1..]  

factorialRec n = fact 1 n 
    where 
        -- :fact :: Int -> Int -> Int 
        fact m n    | m > n     = 1 
                    | m <= n    = m * fact (m+1) n 
                    
-- prop_fac n = factorial n == factorialRec n 

-- Counting 
-- enumFrom 0 == [0..] 
en5mFrom m  = m : enumFrom (m+1) 

z3p [] _            = [] 
z3p _ []            = [] 
z3p (x:xs) (y:ys)   = (x,y) : z3p xs ys 

-- 
