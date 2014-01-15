{-# LANGUAGE NPlusKPatterns #-}
module Ch6examp where
-- ghci -XNPlusKPatterns
import qualified Data.List as D 

 
-- Remember order of arg evaluation doesn't matter as much in Pure FP.

-- 6.1 -- 
factorial               :: Int -> Int 
factorial n             = product(take n [1..n])

f2ctorial               :: Integral a => a -> a         
f2ctorial n             = product(D.genericTake n [1..n])
-- Int v. Integer in factorial results; perhaps it's the repl only?  
fact4rial               :: Int -> Int 
fact4rial 0		= 1
fact4rial (n + 1)       = (n + 1) * factorial n              

f2ct4rial               :: Integral a => a -> a 
f2ct4rial 0		= 1
f2ct4rial (n + 1)       = (n + 1) * f2ctorial n    

{- factoriaL               :: Int -> Int 
factoriaL [] 		= []
factoriaL [0]		= [1]
factoriaL (n + 1)       = (n + 1) * factorial n              

-- f2ctoriaL               :: Integral a => a -> a 
f2ctoriaL 0		= 1
f2ctoriaL (n + 1)       = (n + 1) * f2ctorial n    
-}

factoriaL n             = [product(take n [1..n])|n<-[1..n]]
f2ctoriaL n             = [product(D.genericTake n [1..n])|n<-[1..n]]
cmpairfact n 		= zip (factoriaL n) (f2ctoriaL n) 

--(*) -- going to have to settle for just two args here
mult 			:: Integer->Integer->Integer
m `mult` 0 		= 0
m `mult`(n+1)		= m+(m`mult`n)
-- 6.2 -- 
pr4duct                 :: [Integer] -> Integer
pr4duct [] 		= 1
pr4duct	(x:xs) 		= x * (pr4duct xs) 
 
l2ngth 			:: [a] -> Integer
l2ngth []		= 0 
l2ngth (_:xs) 		= 1 + l2ngth xs 

r2verse 		:: [a]->[a]
r2verse []		= []
r2verse (x:xs) 		= r2verse xs ++ [x]  

-- (++)
join 			:: [a]->[a]->[a]
[] `join` ys 		= ys
(x:xs) `join` ys	= x:(join xs ys) 

{- > join [1,2,3] [4,5,6]
[1,2,3,4,5,6]
-}

ins2rt 				:: Ord a => a->[a]->[a]
ins2rt x []			= [x] 
ins2rt x (y:ys) |x<=y		= x:y:ys
		|otherwise	= y:ins2rt x ys

is4rt			:: Ord a=>[a]->[a]
is4rt [] 		= []
is4rt (x:xs) 		= ins2rt x (is4rt xs) 

-- 6.3 -- Multi args
z3p  			:: [a]->[b]->[(a,b)] 
z3p  [] _ 		= []
z3p  _ [] 		= []
z3p  (x:xs) (y:ys) 	= (x,y):z3p  xs ys 			

dr4p 			:: Integer -> [a]->[a]
dr4p 0 xs 		= xs 
dr4p (n+1) []		= []
dr4p (n+1) (_:xs) 	= dr4p n xs 

-- > dr4p 5 [1..11]
-- [6,7,8,9,10,11]

-- 6.4 -- Multiple recursion 
fibonacc3		:: Integer -> Integer 
fibonacc3 0		= 0
fibonacc3 1		= 1 
fibonacc3 (n+2) 	= fibonacc3 n + fibonacc3 (n+1) 


-- compare to first meeting
qsort 			:: Ord a => [a]->[a] 
qsort [] 		= []
qsort (x:xs) 		= qsort smaller ++ [x] ++ larger
			  where 
				smaller = [a|a<-xs,a<=x]
				larger	= [b|b<-xs,b>x]

-- 6.5 -- mutual recursion 
ev2n 			:: Integer -> Bool
ev2n 0 			= True
ev2n (n+1) 		= odd n

oDD 			:: Integer -> Bool 
oDD 0			= False
oDD (n+1) 		= ev2n n  

--  ev2n 5
--  False
--  ev2n 6
--  True
--  oDD 0
--  False

-- this uses position not value;  evens [0..n] will return evens 
-- return the opposite  [1..n] will not. 

evens 			:: [a] -> [a] 
evens 	[]		= []
evens 	(x:xs) 		= x:odds xs  

odds 			:: [a] -> [a] 
odds []			= []
odds (_:xs)		= evens xs  

-- 6.6 --  
-- 6.8.1 -- 
-- do the (^) operator  like we did for (*) 
{- 
mult 			:: Integer->Integer->Integer
m `mult` 0 		= 0
m `mult`(n+1)		= m+(m`mult`n)


our type def. 
(^) :: (Num a, Integral b) => a -> b -> a       -- Defined in `GHC.Real'
-}
eXpo :: (Integral a, Num a1) => a1 -> a -> a1
m `eXpo`  0 = 1
m `eXpo` (n+1) = m * m `eXpo` n
-- > 2 `eXpo` 3
-- 8
{-
2 `eXpo` 3
= {applying `eXpo` } 
2 * (2 `eXpo` 2)
= {applying `eXpo` } 
2*(2*(2 `eXpo` 1))
= {applying `eXpo` }
2*(2*(2*(2  `eXpo` 0)))
= {applying `eXpo` }
2*(2*(2*1)) 
= {applying * }
8
-}
{- 6.8.2.1 --
length [1,2,3] 
= {applying length}
1+ length [2,3] 
= {applying length}
1+(1 + length [3])
= {applying length}
1 +(1+(1(1 + 0)))
= {applying +}
3
-}
{- 6.8.2.2 -- 
drop 3 [1,2,3,4,5] 
= {applying drop}
drop 2 [2,3,4,5]
= {applying drop}
drop 1 [3,4,5]
= {applying drop} 
drop 0 [4,5]
= {applying drop}
[4,5] 
-}
{- 
init [1,2,3]
= {applying init}
1:init [2,3] 
= {applying init}
1:2:init [3] 
= {applying init}
1:2:[]
= { list notation}
[1,2] 
-}
-- 6.8.3 --  
 
-- and :: [Bool] -> Bool 	-- Defined in `GHC.List'
aNd []					= True 
aNd (b:bs)              = b && aNd bs

c4ncat []               = [] 
c4ncat (xs:xss)         = xs ++ c4ncat xss

-- r2plicate :: Int -> a -> [a] 	-- Defined in `GHC.List'
r2plicate 0 _           = []
r2plicate (n+1) x       = x:r2plicate n x 

-- (x:_)!!0             = x 
-- (_:xs)!!(n+1)        = xs!!n



el2m :: Eq a => a -> [a] -> Bool 
el2m x []                   = False 
el2m x (y:ys)   | x==y      = True
                |otherwise  = el2m x ys 

-- 6.8.4 -- 
merge :: Ord a => [a] -> [a] -> [a]
merge [] ys             = ys
merge xs []             = xs 
merge (x:xs) (y:ys)     = if x <= y then
                            x:merge xs (y:ys) 
                          else 
                            y:merge (x:xs) ys 

-- 6.8.5 -- 
halve xs                = splitAt (length xs `div` 2) xs

msort []                = [] 
msort [x]               = [x]
msort xs                = merge(msort ys) (msort zs) 
                            where (ys, zs) = halve xs 

{- 6.8.6.1 --  
1. define type
s5m                     :: [Int] -> Int
2. enumerate the cases 

sum []                  = 
sum (x:xs)              = 

3. define the simple case
sum []                  = 0 
sum(x:xs)               =

4. define other cases 
sum []                  = 0 
sum (x:xs)              = x + sum xs

5. generalise and simplify  
sum                     :: Num a => [a] -> a 
sum                     = foldr (+) 0 

{- 6.8.6.2 -- 
1. define type 
take                    :: Int -> [a] -> [a] 

2. enumerate the cases 

take 0 []               = 
take 0 (x:xs)           = 
take (n+1) []           = 
take (n+1) (x:xs)       = 

3. define simple cases 
take 0 []               = [] 
take 0 (x:xs)           = []
take (n+1) []           = [] 
take (n+1) (x:xs)       =   

4. define the other cases     
take 0 []               = [] 
take 0 (x:xs)           = []
take (n+1) []           = [] 
take (n+1) (x:xs)       = x:take n xs 

5. generalise and simplify 
take                    :: Int -> [a] -> [a] 
take 0 _                = []
take (n+1) []           = [] 
take (n+1) (x:xs)       = x:take n xs 

-- 6.8.6.3 -- 
1. define type 
last                    :: [a] -> [a] 

2. enumerate the cases 

last (x:xs)             = 

3. define simple cases 
last (x:xs)             = 
take (x:xs)     | null xs           = x
                | otherwise         = 

4. define the other cases     
last (x:xs)             = 
take (x:xs)     | null xs           = x
                | otherwise         = last xs 

5. generalise and simplify 
last                                :: [a] -> [a] 
last [x]                            = x
last (_:xs)                         = x

-}
