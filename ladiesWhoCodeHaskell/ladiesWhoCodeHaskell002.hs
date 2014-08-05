module Lwch002 where 
-- http://learnyouahaskell.com/chapters 
-- :retab 
-- :set expandtab ts=2 linebreak  
-- :set +s 
-- let fn003 =  fn001 / fn000   
{-
Prelude> -- our base library
 
-- repl commands
:l 
:r 
:t
:i 
:! 

myFile.hs

:set prompt "ghci> "
---------------------------------

simple math 

ghci> 2 + 15  
17  
ghci> 49 * 100  
4900  
ghci> 1892 - 1472  
420  
ghci> 5 / 2  
2.5  

ghci> (50 * 100) - 4999  
1  
ghci> 50 * 100 - 4999  
1  
ghci> 50 * (100 - 4999)  
-244950  


5 * -3 
ghci> 5 * -3

<interactive>:7:1:
    Precedence parsing error
        cannot mix `*' [infixl 7] and prefix `-' [infixl 6] in the same infix expression

ghci> 5 * (-3)
-15

-- True and False 
ghci> True && False  
False  
ghci> True && True  
True  
ghci> False || True  
True   
ghci> not False  
True  
ghci> not (True && True)  
False  

ghci> 5 == 5  
True  
ghci> 1 == 0  
False  
ghci> 5 /= 5  
False  
ghci> 5 /= 4  
True  
ghci> "hello" == "hello"  
True   

---------functions------
-- functions are the work horse of Haskell

ghci> succ 8  
9   
-- function with two arguments
ghci> min 9 10  
9  
ghci> min 3.4 3.2  
3.2  
ghci> max 100 101  
101  

---------------------------------
-- unlike lisp 
-- white space can stand in for parentheses 
-- you can use them but they are mostly optional
-- when groupings are ambiguous you might have to 

ghci> succ 9 + max 5 4 + 1  
16  
ghci> (succ 9) + (max 5 4) + 1  
16  

ghci> max (5 + 2) (sqrt 17)
7

div 92 10 
-- not apostrophies but back-ticks 
-- just a way to do things in fix style
92 `div` 10 
---------------------------------
-}

---------Making-your-own-Functions------------------------

-- note there are no parens, commas, braces, returns, blocks, etc.
doubleMe x = x + x 

-- to write this in the repl the "let" prefix is required.
----------------------------------------------------------


-- conditionals ---------------- 
-- no dangling elses 
doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  
---------------------------------
{-
--------Lists--------------------
ghci> [] == []
True
ghci> [] == [[]]
False

ghci> [3,4,2] == [3,4,2]
True

ghci> head [5,4,3,2,1]  
5   

ghci> tail [5,4,3,2,1]  
[4,3,2,1] 


ghci> last [5,4,3,2,1]  
1  

ghci> init [5,4,3,2,1]  
[5,4,3,2]  

ghci> head []
*** Exception: Prelude.head: empty list


ghci> length [5,4,3,2,1]
5

ghci> null [1,2,3]
False
ghci> null []
True
ghci> reverse [5,4,3,2,1]
[1,2,3,4,5]
ghci> take 3 [5,4,3,2,1]
[5,4,3]
ghci>  take 5 [1,2]
[1,2]
ghci> take 0 [6,6,6]
[]

ghci> drop 3 [8,4,2,1,5,6]
[1,5,6]

ghci> minimum [8,4,2,1,5,6]  
1  
ghci> maximum [1,9,2,3,4]  
9   

ghci> sum [5,2,1,6,3,2,5,7]  
31  
ghci> product [6,2,1,2]  
24  
ghci> product [1,2,5,6,7,9,2,0]  
0   

ghci>  10 `elem` [3,4,5,6]
False

ghci> [1..20]
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

ghci> ['a'..'z']
"abcdefghijklmnopqrstuvwxyz"

ghci> ['K'..'Z']
"KLMNOPQRSTUVWXYZ"


ghci> [2,4..20]
[2,4,6,8,10,12,14,16,18,20]

-- Floating Point weirdness 
ghci> [0.1, 0.3 .. 1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

ghci> take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]

ghci> take 10 (repeat 5)
[5,5,5,5,5,5,5,5,5,5]
----------------------------------
-}
---------------------------------
fn003 =  fn001 / fn000 
fn000 =  (6 * (7 + 5 /2)^2) + 2

fn001a :: Int -> Int -> Int 
fn001a x  y = (+) x  y  
fn001 = (+) (6 * (7 + 5 /2)^2) (2 * (product(take 5[1..])))

-------------------
-- fn003 see above
------------------
fn002  x y z  = (/)  (x + y ^ z) w
		where 
		w=2 


fn004 x y z  = x + y ^ z * w  
              where 
              w = sum(head[101..201] : tail[1..100]) 
              a = [] 

------------------------------
-- :i fn004 
----------------------------               

-- quickcheck these 
-- because there are no side effects 
-- their is no state 
-- I don't have to test what the type system will catch
-- I don't have to worry about Strings passed in or Null pointers
myFun001 x y = x + y 
myFun002 a b = a + b 



