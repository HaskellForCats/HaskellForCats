module LwchTwo where 
-- http://learnyouahaskell.com/chapters 
-- : retab 
-- : set expandtab ts=4 ruler number spell linebreak

-- :set +s 
-- let fn003 =  fn001 / fn000   
{-





my #1 source of pain in learning Haskell was tabs. CONVERT ALL TABS TO SPACES! 
Tabs can make perfectly correct code not compile.

 






Prelude> -- our base library
 
-- repl commands
:l 
:r 
:t
:i 
:! 
:m

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
-- functions are the workhorse of Haskell

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
-- But when groupings are ambiguous you will have to 

ghci> succ 9 + max 5 4 + 1  
16  
ghci> (succ 9) + (max 5 4) + 1  
16  

ghci> max (5 + 2) (sqrt 17)
7

div 92 10 
-- not apostrophise but back-ticks 
-- a way to do functions fix style
92 `div` 10 
---------------------------------
-}

---------Making-your-own-Functions------------------------

-- note there are no parens, commas, braces, returns, blocks, etc.
doubleMe x = x + x 

-- to write this in the repl the "let" prefix is required.
----------------------------------------------------------


-- conditionals ---------------- 
-- note! no dangling elses 
-- generally things should terminate 
doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  
---------------------------------
{-
----------------------------------
-}
----------------------------------
----Functions-calling-Functions-----
---------------------------------
-- functions can call other functions from within functions
-- this is similar to recursion where we call the same function on itself.

-- multMax :: (Ord a, Num a) => a -> a -> a -> a
multMax a b x = (max a b) * x 


fn003 =  fn001 / fn000 
fn000 =  (6 * (7 + 5 /2)^2) + 2


-- myFun001 :: Int -> Int -> Int 
myFun001 x  y = (+) x  y  
-- *Lwch002> myFun001 (1/2) 2


fn001 = (+) (6 * (7 + 5 /2)^2) (2 * (product(take 5[1..])))
fn001b = (6 * (7 + 5 /2)^2) + (2 * (product(take 5[1..])))

fn001c x = (+) (6 * (7 + 5 /2)^2) (x * (product(take 5[1..])))
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
-- *Lwch002> fn004 4 5 6.0
-- *Lwch002> fn004 4 5.0 6
-- fn004 :: (Num a, Integral b, Enum a) => a -> a -> b -> a
------------------------------
-- :i fn004 
----------------------------               
-- :t fn004 0.3 5.0 (length "Hello")


-----------------------------------
-- Function Purity ---------------
-----------------------------------
-- TypeClassHierarchy pdf --------
-----------------------------------
-- purity means isolated from context.
-- purity means	isolated from state.
-- running a function shouldn't change anything. 
-- a.k.a. "launch the missiles!" 
-- The hard part is they can't rely on context either.
-- but the benefit is reliability 
-- Same args ---> same result!! -- always! 

-- Anything else is impure.
-- is this "simple made hard?" 
-- remember the first 7 years of Haskell's existence ...

-------------------------------
-- printing is impure
-- reading from a file is impure
-- generating a random number
- getting the current time 
--------------------------------
-- all these things must be approached differently
-- but what do I get for my trouble?

-- Certainty, reliability, speed, ease of parallelization;
-- When we get the logic of our functions right 
-- and those functions compile 
-- there are no side-effects 
-- there is no state 
-- therefore (up to 90%) less testing 
-- note: SkedgeMe doesn't test it's back-end, the Haskell part it's tests are confined to the front-end JavaScript.



-------------------------------





-------------------------------
-- quickcheck these 
-- because there are no side effects 
-- their is no state 
-- I don't have to test what the type system will catch
-- I don't have to worry about Strings passed in where numbers should be or asking only to be surprised with nothing a.k.a. Null pointers.
someFun001 x y = x + y 
someFun002 a b = a + b 



