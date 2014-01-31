module HighOrdFun where 
-- : set expandtab ts=4 ruler number spell
fn7 n = length(show n) 

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
-}

------------------
-- FOLDL and FOLDR --  
-- ---------------
{- fold collects from a list and reduces the collection to a new single value
*HighOrdFun> foldl (+) 0 [1..11]
66
-- 0 is the accumulator value (acc) and we want to start accumulating from zero. 
-- but we could start with any value.
*HighOrdFun> foldl (+) 10 [1..11]
76 
*HighOrdFun> foldl (+) (-10) [1..11]
56

-- just like sum but different.  
*HighOrdFun> sum [1..11]
66 
*HighOrdFun> sum [1..11] == foldl (+) 0 [1..11]
True
-} 
-- show is basically a to->string function 
showPlus :: Show a => [Char] -> a -> [Char]
showPlus s x = "(" ++ s ++ "+" ++ (show x) ++ ")"
{-
 - *HighOrdFun> showPlus "(1+2)" 3
   "((1+2)+3)"

*HighOrdFun> foldl showPlus "0" [1..11]
"(((((((((((0+1)+2)+3)+4)+5)+6)+7)+8)+9)+10)+11)"
-- take out the quotes and we get 
*HighOrdFun> (((((((((((0+1)+2)+3)+4)+5)+6)+7)+8)+9)+10)+11)
66

-} 
---------------------------------
-- showCons ? how would that work 
---------------------------------
{- 
 - Prelude> foldr (+) 0 [1..11]
   66
-- does the same thing but the accumulator goes to the other side 
--
-}
showPlus' :: Show a => a -> [Char] -> [Char]
showPlus' x s = "(" ++ (show x) ++ "+" ++ s ++ ")" 
{-
*HighOrdFun> foldr showPlus' "0" [1..11]
"(1+(2+(3+(4+(5+(6+(7+(8+(9+(10+(11+0)))))))))))"

*HighOrdFun> foldr (-) 0 [1..11]
6
*HighOrdFun> foldl (-) 0 [1..11]
-66
*HighOrdFun> foldl (*) 0 [1..11]
0
*HighOrdFun> foldr (*) 0 [1..11]
0
*HighOrdFun> foldr (*) 1 [1..11]
39916800
*HighOrdFun> foldl (*) 1 [1..11]
39916800
*HighOrdFun> foldl (+) 1 [1..11]
67
*HighOrdFun> foldr (+) 1 [1..11]
67
*HighOrdFun> foldr (/) 1 [1..11]
2.7070312499999996
*HighOrdFun> foldl (/) 1 [1..11]
2.505210838544172e-8
*HighOrdFun> foldl (/) 0 [1..11]
0.0
*HighOrdFun> foldr (/) 0 [1..11]
Infinity

-- foldl is tail recursive but NOT ON AN INFINITE LIST
-- foldr can be used on an infinite list with caution 

---------- -- 
-- ZIPWITH -- 
-- ------- --
combines zip with a (function)
*HighOrdFun> zipWith (*) [1..11] [101..111]
[101,204,309,416,525,636,749,864,981,1100,1221]
*HighOrdFun> zipWith (+) [1..11] [101..111]
[102,104,106,108,110,112,114,116,118,120,122]
*HighOrdFun> zipWith (+) [1..11] [101..1111]
[102,104,106,108,110,112,114,116,118,120,122]
*HighOrdFun> zipWith mod  [1..11] [2..12]
[1,2,3,4,5,6,7,8,9,10,11]
*HighOrdFun> zipWith (/)   [2,3,4] [1,2,3]
[2.0,1.5,1.3333333333333333]
-}
mult3 x y z = x*y*z 
{- zipWith3 needs a function that can take three arguments
 - *HighOrdFun> zipWith3 mult3   [2,3,4] [1,2,3] [0,1,2]
   [0,6,24]

if we wanted to do it with addition but didn't want to have to throw in another 
named function we could have done it this way:  
*HighOrdFun> zipWith3 (\ x y z -> x+y+z)   [2,3,4] [1,2,3] [0,1,2]
[3,6,9]

or with currying 
*HighOrdFun> zipWith3 (\x -> \y -> \z -> x+y+z)   [2,3,4] [1,2,3] [0,1,2]
[3,6,9]

*HighOrdFun> map (\x -> 2 * x) [1..11]
[2,4,6,8,10,12,14,16,18,20,22]

which is the same as: 
*HighOrdFun> map (\x -> 2 * x) [1..11] == map (*2) [1..11]
True

because map has to touch the list [1..11] for it's second argument  
*HighOrdFun> map (\x -> 2 * x +1) [1..11]

[3,5,7,9,11,13,15,17,19,21,23]
we can't just throw another (+1) 
we so we have to call map recursively  
but even that isn't right
*HighOrdFun> map (*2) (map (1+) [1..11])
[4,6,8,10,12,14,16,18,20,22,24]
so we would have to go further 
*HighOrdFun> map (+(-1)) (map (*2) (map (1+) [1..11]))
[3,5,7,9,11,13,15,17,19,21,23]

*HighOrdFun>  map(+(-1))(map(*2)(map (1+)[1..11])) == map(\x -> 2 * x +1)[1..11]
True
-}

------------------------
-- FUNCTION OPERATORS -- 
-- ---------------------
-- (.) function composition 
-- ($) application 


-- length :: [a] -> Int    -- Defined in `GHC.List'

{-class Show a where
  ...
  show :: a -> String
  ...
        -- Defined in `GHC.Show'-} 
-- stringLength :: [a] -> String 
-- stringLength n = length.show n
-- stringLength :: Show a => a -> Int
stringLength n = length(show n)      
{-
*HighOrdFun> stringLength [1..11]
"11" 
*HighOrdFun> stringLength (product [x^2|x<-[1..1111]])
5807
-} -- fn7 (product [x^2|x<-[1..1111]])


