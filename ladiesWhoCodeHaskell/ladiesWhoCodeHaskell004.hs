module Lwch004 where 
-- fun with GHC
-- : retab 
-- : set +s 
--  set expandtab ts=4 ruler number spell linebreak
import Prelude hiding (null)


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
snd (2 "No Way) 


fst ((1,"What!"),(2,"No Way"))
snd ([1..7],"Sorry")

-}
-- when tuples get too big, over 4 members
-- then an Algebraic Data Type will work better.

-------------------
-- pattern matching
-------------------

null [] = True
null (x:xs) = False

head' (x:xs)    = (x:[]) 
head' []        = []

-- head (head' [0..11]) 
