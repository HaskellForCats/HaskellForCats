module Jan24 where
import Test.QuickCheck
{-- EXTRA LIST COMPREHENSION ------------------------
note that i connects and continues in the second list generator.
[ (i,j) | i <- [1..3], j <-[i..3]] 
= 
  [(i,j)  | j <- [1..3]] ++
  [(2,j)  | j <- [2..3]] ++
  [(3,j)  | j <- [3..3]] ++
=
  [(1,1),(1,2),(1,3)] ++
  [(2,2),(2,3) ] ++
  [(3,3)] ++
= 
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]
--------------------------------------------
-- adding a filter
-------------------------------------------
[ (i,j) | i <- [1..3], j <-[1..3], i <= j ]
=
  [ (1,j) | j <- [1..3],1 <= j ] ++
  [ (2,j) | j <- [1..3],2 <= j ] ++
  [ (3,j) | j <- [1..3],3 <= j ]
=
  [(1,1)|1<=1]++[(1,2)|1<=2]++[(1,3)|1<=3]++
  [(2,1)|2<=1]++[(2,2)|2<=2]++[(1,3)|2<=3]++
  [(3,1)|3<=1]++[(3,2)|3<=2]++[(3,3)|3<=3]
=
  [(1,1)] ++ [(1,2)] ++ [(1,3)] ++
  []      ++ [(2,2)] ++ [(2,3)] ++
  []      ++ []      ++ [(3,3)]
=
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

------------------------------------------
-- FORMAL DEFINITION FOR LIST COMPREHENSION
------------------------------------------
  q ::= x <- l, q | b, q | * 

[e | * ] -- empty
  = [e]  
[e | x <- [l1,...,ln],q] 
  = (let x = l1 in [e | q ]) ++ ... ++ (let x = ln in [e | q ]) 

[e | b, q ] 
  = if b then [ e | q ] else []

-----------------------------------------
-- HERE IT IS AS A PROGRAM
-----------------------------------------
in the lists comprhension they are either drawn from or filters 

[(i,j) | i <- [1..3], j <- [1..3], i <= j, * ]

----------------------------------------
-- the goal is to a capture a pattern that appears over and over and capture it in a single function.
----------------------------------------}
--       MAP -- FILTER -- FOLD -- 
----------------------------------------
-- TEMPLATE HASKELL is Meta Haskell which can alter/influence Haskell 

squares xs           = [ x*x | x <- xs] 

squares' []          = []
squares' (x:xs)      = x*x : squares xs

prop_sqr xs  = squares' xs  == squares xs
-- prop_ is the predicate that suggests that we will propositionally test an expression / assertion
-- our current assertion is that squares' will yield the same result as squares, and we will generate random inputs that conform to the given type latitudes allowed.
{-
*Jan24> quickCheck prop_sqr
Loading package array-0.4.0.1 ... linking ... done.
Loading package deepseq-1.3.0.1 ... linking ... done.
Loading package old-locale-1.0.0.5 ... linking ... done.
Loading package time-1.4.0.1 ... linking ... done.
Loading package random-1.0.1.1 ... linking ... done.
Loading package containers-0.5.0.0 ... linking ... done.
Loading package pretty-1.1.1.0 ... linking ... done.
Loading package template-haskell ... linking ... done.
Loading package QuickCheck-2.6 ... linking ... done.
+++ OK, passed 100 tests.
-} 
