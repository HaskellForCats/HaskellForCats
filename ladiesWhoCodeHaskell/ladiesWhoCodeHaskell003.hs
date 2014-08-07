module Lwch003 where 
-- fun with GHC
-- : retab 
-- : set +s 
--  set expandtab ts=4 ruler number spell linebreak

----------------
-- recursion -- 
----------------
-- a function calling itself.


qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ larger
                          where
                                smaller = [a|a<-xs,a<=x]
                                larger  = [b|b<-xs,b>x]


-- qsort        :: Ord a => [a]->[a]

------------------
-- Lists -- 
------------------
-- no lists of any type 
-- all lists must be same type
-- recursion is how we loop through lists
empty = []
x = [1,2,3] 
y = 0 : x   
z = empty:empty:empty



xa= 1:(2:(3:(4:[])))
xb= 1:2:3:4:[]
xc :: [Int] 
xc = 1:2:3:4:[]
  
-- :t 0:1:2:3:4:empt

str = "I am a list of characters"
str' = 'I':' ':'a':'m':' ':'a':' ':'l':'i':'s':'t':' ':'t':'o':'o':'!':[] 
-- length ['a'..'z']
-- zip  [1..12] "Call me Ishmael"

count x xs      = length [x'|x' <- xs, x == x']
-- count 'a'  "Call me Ishmael"

doubleList [] = []  
doubleList x = (2 * (head x)) ++ (doubleList (tail x))           
