module Lwch002 where 
-- fun with GHC
-- :retab 
-- :set expandtab ts=2 linebreak  
-- :set +s 
-- let fn003 =  fn001 / fn000   
{-
Prelude>
 
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

ghci> succ 8  
9   

ghci> min 9 10  
9  
ghci> min 3.4 3.2  
3.2  
ghci> max 100 101  
101  

---------------------------------
ghci> succ 9 + max 5 4 + 1  
16  
ghci> (succ 9) + (max 5 4) + 1  
16  

div 92 10 

92 `div` 10 

doubleMe x = x + x 


doubleSmallNumber x = if x > 100  
                        then x  
                        else x*2

doubleSmallNumber' x = (if x > 100 then x else x*2) + 1  

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

ghci> [0.1, 0.3 .. 1]
[0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]

ghci> take 10 (cycle [1,2,3])
[1,2,3,1,2,3,1,2,3,1]

ghci> take 10 (repeat 5)
[5,5,5,5,5,5,5,5,5,5]

ghci> [x*2 | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]

ghci> [x*2 | x <- [1..10], x*2 >= 12]
[12,14,16,18,20]

ghci> [ x | x <- [50..100], x `mod` 7 == 3]
[52,59,66,73,80,87,94]

------------------------------
ghci> boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x] 


ghci> [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
[10,11,12,14,16,17,18,20]

ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]
[16,20,22,40,50,55,80,100,110]

ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
[55,80,100,110]

-------------------------------
ghci> let nouns = ["hobo","frog","pope"]  
ghci> let adjectives = ["lazy","grouchy","scheming"]  
ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]  
["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",  
"grouchy pope","scheming hobo","scheming frog","scheming pope"]  

ghci> zip [1..] ["apple", "orange", "cherry", "mango"]
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]
--------------------------------
ghci> let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]

ghci> let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

ghci> let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]
--------------------------------
-- Types 
--------------------------------
ghci> :t 'a'  
'a' :: Char  
ghci> :t True  
True :: Bool  
ghci> :t "HELLO!"  
"HELLO!" :: [Char]  
ghci> :t (True, 'a')  
(True, 'a') :: (Bool, Char)  
ghci> :t 4 == 5  
4 == 5 :: Bool  

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



