module Ch1ListsRecur where 
-- : set expandtab ts=4 ruler number spell
-- import Data.Char
import Test.QuickCheck 
{- Church of Recursion
Recursion gets you everything you would want just as well as a Turing Machine 

a recursive definition of a list
    null, is in [] 
    or 
    constructed as in x:xs 
        with head x an element and tail xs as a list 

Cons as in Construct And Append 

(:) :: a -> [a] -> [a]
(++) :: [a] -> [a] -> [a]

*Ch1ListsRecur> 1:[2,3]
[1,2,3]

*Ch1ListsRecur> [1]++[2,3]
[1,2,3]

*Ch1ListsRecur> [4]++[2,3]++[1]
[4,2,3,1]

*Ch1ListsRecur> 'r':"ecursion"
"recursion"

*Ch1ListsRecur> "re"++ "cursion"
"recursion"

*Ch1ListsRecur> 1:2:3:4:[]
[1,2,3,4]


*Ch1ListsRecur> [4]:[2,3]:[1] -- error
<interactive>:14:2:
    No instance for (Num t0) arising from the literal `4'

    
*Ch1ListsRecur> "h":"e":"l":"l":"o":[]
["h","e","l","l","o"]
*Ch1ListsRecur> 'h':'e':'l':'l':'o':[]
"hello"

*Ch1ListsRecur> null []
True
*Ch1ListsRecur> null [1,2]
False

*Ch1ListsRecur> tail [1,2]
[2]
*Ch1ListsRecur> tail [1]
[]
*Ch1ListsRecur> head [1,2,3]
1
*Ch1ListsRecur> head []
*** Exception: Prelude.head: empty list
    
*Ch1ListsRecur> head "re":"ecursion"
"recursion"

*Ch1ListsRecur> tail "re"++ "cursion"
"ecursion"

*Ch1ListsRecur> head "re"++ "cursion"

<interactive>:29:6:
    Couldn't match type `Char' with `[Char]'
    Expected type: [[Char]]
      Actual type: [Char]
    In the first argument of `head', namely `"re"'
    In the first argument of `(++)', namely `head "re"'
    In the expression: head "re" ++ "cursion"

-}
-- as a list comprehension 
squares :: [Integer] -> [Integer] 
squares xs = [x * x | x <- xs]

-- as Recursion 
squaresRec :: [Integer] -> [Integer] 
squaresRec []       = [] 
squaresRec (x:xs)   = x*x : squaresRec xs 

-- *Ch1ListsRecur> squaresRec [1,2,3]
-- [1,4,9]

{- another way to look at this is 
squaresRec is either [] 
or it is built with cons (:)

            squaresRec [1,2,3]
= same as
             squaresRec (1 : (2 : (3 : [] )))
because this isn't the empty list it must be a constructed list 
the head of the constructed list is x and it is :xs as in (x:xs) = which is the same on the other side of the = where the head of the list is  x*x, and the tails is : squareRec xs 
stated another way 

heads are equivalent 
squaresRec x = x * x 
tails are also equivalent
squareRec :xs = :squareRec xs -- this is associative 


            squaresRec (1 : (2 : (3 : [] )))
=           { x =1, xs = (2 : (3 : [] )) } 
        1*1 : squaresRec (2:(3: [] ))
=           { x = 2, xs = (3 : []) } 
        1*1 : (2*2 : squaresRec (3 : [] )) 
=           { x = 3, xs = [] }  
        1*1 : (2*2 : (3*3  : squaresRec [] ))  
=                                          
        1*1 : (2*2 : (3*3 : [] ))
=
        1 : (4 : (9 : []))        
= 
        [1,4,9]

As a Conditional it would be ---------------}

squaresCond :: [Integer] -> [Integer]  
squaresCond ws = 
    if null ws then 
        [] 
    else 
        let 
            x = head ws 
            xs = tail ws 
        in 
            x*x  : squaresCond xs 

-- now you could check the acurracy with QuickCheck.

prop_condRec :: [Integer] -> Bool 
prop_condRec xs = (squaresCond xs) == (squares xs)

{- -- applying quickCheck 
*Ch1ListsRecur> QuickCheck prop_condRec 

<interactive>:2:1: Not in scope: data constructor `QuickCheck'
*Ch1ListsRecur> quickCheck prop_condRec 
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

prop_ifCondRec :: [Integer] -> Bool 
prop_ifCondRec xs = (squaresCond xs) == (squaresRec xs)
{- *Ch1ListsRecur> quickCheck prop_ifCondRec 
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
-- odds 
-- comprehension 
odds :: Integral t => [t] -> [t]
odds xs = [x | x <- xs, odd x ]
-- Recursively 
oddsRec :: Integral a => [a] -> [a]
oddsRec []                  = []
oddsRec (x:xs)  | odd x     = x : oddsRec xs 
                | otherwise = oddsRec xs 

prop_RecOdds xs = oddsRec xs == odds xs 
