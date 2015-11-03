module Patterns where 
import Prelude hiding (fst,null,head) 
-- PATTERN MATCHING 

fst :: (t, t1) -> t
fst (a,b) = a 


null :: [t] -> Bool
null [] = True 
null (x:xs) = False -- anything that uses the cons operator will be automatically be read as false. 

head (x:xs) = x -- note! that we take the front of the cons  
-- leave it blank 
-- ghci> head "hello" 
-- 'h'
-- ghci> head [1]
-- 1
-- ghci> head []
-- *** Exception: 2014-0214case.hs:13:1-15: Non-exhaustive patterns in function head
-- or we could try and give a message
-- ghci> :t head 
-- head :: [[Char]] -> [Char]
-- head [] = "CRASH" -- with out the error handler we end up Type restricted
-- ghci> head []
-- "CRASH"
-- ghci> head [1]
-- 
-- <interactive>:3:7:
--     No instance for (Num [Char]) arising from the literal `1'
--     Possible fix: add an instance declaration for (Num [Char])
--     In the expression: 1
--     In the first argument of `head', namely `[1]'
--     In the expression: head [1]
-- head [] = 0
-- could then try this definition 
-- head [] = [] 
-- ghci> head []
-- []
-- the above works but it isn't in keeping with purity in head's original definition
-- Lastly we could define an error exception 
head [] = error "No option for empty lists" 
-- ghci> head []
-- *** Exception: No option for empty lists 


-- head and tail are fragile.  
-- adding the type class post hoc is better than leaving it blank 
-- here's a design pattern where: 
--        if x then y  else ourFunction that needs a front end filter. Which could also be accomplished with pattern matching   
-- double :: Num a => [a] -> [a] 
-- double nums = 
--     if null nums 
--     then [] 
--     else (2 * (head nums)) : (double (tail nums))

-- ghci> double [4,8..23]
-- [8,16,24,32,40]

-----------------------------------
-- GOOD PATTERNS ARE MORE ROBUST --
-----------------------------------

double [] = [] 
double (x:xs) = (2* x) : (double xs)
-- ghci> double [4,8..23]
-- [8,16,24,32,40]


