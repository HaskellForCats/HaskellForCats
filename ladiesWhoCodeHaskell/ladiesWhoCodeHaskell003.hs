module Lwch003 where 
-- fun with GHC
-- : retab 
-- : set +s 
--  set expandtab ts=4 ruler number spell linebreak

------------------
-- Lists -- 
------------------
-- no "any" type lists 
-- all lists must be SAME type
-- recursion is how we loop through lists
--------Lists--------------------
{-
---------------------------------
-- lists are one of the primary data structures 
-- but list elements most be of the same type.
-- hetrogenious elements go into tuples. 

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
-- !!!!!!!!!!!!!!!!!!!!!!!!
ghci> [0.1, 0.3 .. 1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

ghci> take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]

ghci> take 10 (repeat 5)
[5,5,5,5,5,5,5,5,5,5]


ghci> zip [1..] ["apple", "orange", "cherry", "mango"]
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]
---------------------------
-}
--------------------------
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
----------------
-- recursion -- 
----------------
-- a function calling itself.



doubleList [] = []  
doubleList x = (2 * (head x)) : (doubleList (tail x))           


dubNum x = 
	if null x 
	then [] 
	else (2 * (head x)) : (dubNum (tail x))




oddGone x =  
    if null x 
    then [] 
    else 
        if (mod(head x) 2) == 0 
        then (head x) : (oddGone (tail x))
        else oddGone (tail x) 

