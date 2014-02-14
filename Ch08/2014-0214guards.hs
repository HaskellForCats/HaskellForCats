module Guards where 
 
-- import Prelude hiding (fst,null,head) 
-- pattern matching looks at the structure of the data while
-- guards can look at the values in the data 
-- starts out looking like any function declaration but note that the = has move down a line
-- pipe | gives use the various conditions
-- in this definition we pulled in the (Eq a, Num a, Num a1) => as constraints. 
 
pow2 :: (Eq a, Num a, Num a1) => a -> a1
pow2 n 
  | n == 0      = 1                  
  | otherwise   = 2 * (pow2 (n-1)) 
--------------------------------------------
-- a somewhat verbose if then 
-- removeOdd :: Integral a => [a] -> [a]
-- removeOdd nums = 
--   if null nums 
--   then [] 
--   else 
--   if  (mod(head nums) 2) == 0 --even? 
--   then (head nums) : (removeOdd (tail nums)) 
--   else removeOdd (tail nums) 
-- 
-- *Guards> removeOdd [1..33]
-- [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32]
-- can be recast as a tidier 
removeOdd [] = [] 
removeOdd (x:xs) 
  | mod x 2 == 0  = x : (removeOdd xs) 
  | otherwise     = removeOdd xs 
-- *Guards> removeOdd [1..33]
-- [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32]
--
--
