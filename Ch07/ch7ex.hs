module Ch7ex where 
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
{-
associativity If a binary operation is associative, repeated application of the operation produces the same result regardless how valid pairs of parenthesis are inserted in the expression 
identity In algebra, an identity or identity element of a set S with a binary operation • is an element e that, when combined with any element x of S, produces that same x. 
commutativity In mathematics, a binary operation is commutative if changing the order of the operands does not change the result.
distributivity 
zero 
idempotence  is the property of certain operations in mathematics and computer science, that can be applied multiple times without changing the result beyond the initial application.
-}
m1p f xs = [f x |x <-xs] 

-- prop_m1p f xs = m1p f xs == map f xs 

f3lter p xs  = [ x | x <- xs, p x] 

filt2r p [] = [] 
filt2r p (x:xs)     | p x           = x : filt2r p xs 
                    | otherwise     = filt2r p xs 

prop_f3lt2r p xs = f3lter p xs == filt2r p xs 
{- 
 - *FuncAsArg> prop_f3lt2r odd [1..11]
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
True
*FuncAsArg> prop_f3lt2r even [1..11]
True
-} 

-- QUICKCHECK EXAMPLES -- 
square x  = x * x 
pyth a b  = square a + square b 
prop_square x = square x >=0   
prop_squares x y = 
    square (x+y) == square x + 2*x*y +square y 
prop_pyth x y = 
    square (x+y) == pyth x y + 2*x*y 

