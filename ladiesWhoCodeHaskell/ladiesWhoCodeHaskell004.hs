module Lwch004 where 
-- : retab 
-- : set +s 
--  set expandtab ts=4 ruler number spell linebreak

-- importing modules and files
import Prelude hiding (null)
-- import ladiesWhoCodeHaskell000

----------------
-- tuples -- 
---------------
-- tuples are the inverse of lists
-- they are bounded, they can have heterogeneous members.
-- the are great for key-value pairs 
-- they are a way to get back multiple parameters from a function 
headAndLength x = (head x,length x) 

{- 
fst (1,"What!") 
snd (2,"No Way") 


fst ((1,"What!"),(2,"No Way"))
snd ([1..7],"Sorry")

-}
-- when tuples get too big, over 4 members or 
-- when you want to pass tuples across multiple files turning them into custom data types makes sense. 
-- then an Algebraic Data Type will work better.

-------------------
-- pattern matching
-------------------
-- not found in imperative languages 
null [] = True
null (x:xs) = False

head' []        = []
head' (x:xs)    = (x:[]) 

-- head (head' [0..11]) 


dubNum'     [] = [] 
dubNum'     (x:xs) = (2*x) : (dubNum' xs) 
---------------------------
-- Guards ---
-- value matching 
----------------------------
myFunNeg   x  
    | x == 0     = 0
    | x >= 1     = 1 
    | x <  1     = (-1)
    | otherwise  = 0


oddGone'    [] = [] 
oddGone'    (x:xs)
    | mod x 2 == 0  = x : (oddGone' xs)
    |otherwise      = oddGone' xs


-- oddGone' [1,3..11]
----------------------
-- case statement 
----------------------
-- an alternative to guards
----------------------
evens x = case (oddGone' x) of 
    []      -> False 
    (x:xs)  -> True 

-- evens (oddGone' [1,3..11])


----- Let and Where -----
-- let at the prompt makes for on-the-fly bindings at the console / repl. 
-- but also in a function too. 
-- but they are immutable, that is unchangeable 
first = 
   let a = (1,"What!")
       b = [] -- note the position of b  
    in (fst a) : b

second = snd a : b
        where 
            a = (2,"No Way")
            b = [] -- note the white space  

third =  5 / (let a = 14 in a +1)  
          
-- third' = 5 / (a + 1 where a = 14)  

----------------------
-- Lazy Evaluation ---
--------------------- 
-- nothing gets computed until needed 
-- and only as much as is needed
-- we can thus play with infinite lists

intsForever x = x : (intsForever (x+1))
ints = intsForever 1 
