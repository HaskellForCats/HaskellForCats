module Lwc002a where 
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

