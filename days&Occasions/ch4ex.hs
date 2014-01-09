module Ch4Pat where 
-- 4.1 -- renaming fuctions ---- 
iSDigit c               = c >= '0' && c <= '9' 

-- 4.2 -- Conditionals --- 00:58 ----- 

aBs n                   = if n >= 0 then n else - n 

--------------------------- 04:01 ----no dangling else!

sigNum n                = if n <0 then -1 else 
                           if n == 0 then 0 else 1   

-- 4.3 -- Guards ----- 05:01 --- boxing 

aBS n       | n >= 0                = n 
            | otherwise             = -n 
----------------------------- better than nested conditionals

sIgnum n    | n < 0                 = -1 
            | n == 0                = 0
            | otherwise             = 1  

-- 4.4 -- Pattern-Matches -- dynamic dispatch in other languages
-- not is nOt so it doesn't conflict 
-- with existing lib function
nOt 	                        :: Bool -> Bool 
nOt False                       = True 
nOt True                        = False

-- Haskell is "too" public says EM -- 18:05 ---------	
-- sectioning is putting () around an operator

-- conj is standing in for (&&) 
conJ        :: Bool -> Bool -> Bool 
conJ x y    |True  && True      = True  
            |otherwise          = False
-- double dispatch -- 22:00 ---  

-- note that laziness means that 
-- nothing gets evaluated until it has to.

-- (&&) 






-- tuples 
fSt :: (t1,t2) -> t1 
fSt (t1,t2)     = t1 
sNd :: (t1,t2) -> t2 
sNd (t1,t2)     = t2 

-- List Patterns 
test :: [Char] -> Bool
test ['a',_,_]  = True
test _          = False 
 
-- cons operator 
{-
*Ch4Pat> :i :
data [] a = ... | a : [a]       -- Defined in `GHC.Types'
infixr 5 :
-} 
