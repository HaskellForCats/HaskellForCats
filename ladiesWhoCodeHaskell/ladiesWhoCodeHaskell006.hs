module Lwch006 where 
-- : retab 
-- : set +s 
-- [count]ge  
-- [count](
-- [count]{
--  set expandtab ts=4 ruler number spell linebreak

{- Haskell's Type System

Haskell's type system combines the good of Dynamic and Static systems. 

Oodles of compile time errors are caught, more than C, C++, Object-C. Because it's twice as strict. 
If you don't want write out a type you mostly don't have to. This is how it feels Dynamic with out the fragility and performance costs. 
Haskell's type system is both robust and flexible and the same code can work for many types. 

The type inference figures what type it must be. If something is ambiguous the compiler will require further specificity.

And as I have shown you can leverage it to learn about functions. 

*Lwch006> let x  = 3 
*Lwch006> :t 3 
3 :: Num a => a

*Lwch006> :t length [1..11]
length [1..11] :: Int

*Lwch006> let x = 'a' 
*Lwch006> :t x
x :: Char
*Lwch006> let x = "Hello World!"  
*Lwch006> :t x 
x :: [Char]

-}
