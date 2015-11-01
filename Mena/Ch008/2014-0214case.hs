module Case where 

-- case is for when we want to pattern match within a larger function 
double :: Num a => [a] -> [a]
double nums = case nums of 
  []        -> [] 
  (x : xs)  -> (2 * x) : (double xs)
-- *Case> double [2..22]
-- [4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44] 

removeOdd [] = [] 
removeOdd (x:xs) 
  | mod x 2 == 0  = x : (removeOdd xs) 
  | otherwise     = removeOdd xs

-- using the result of the above function we write 
anyEven nums  = case (removeOdd nums) of -- if we remove all the odd numbers
  []          -> False                  -- and nums isn't now empty empty  
  (x:xs)      -> True                   -- then what's left MUST be evens 

-- *Case> anyEven [1,3..33]
-- False
-- *Case> anyEven [1..33]
-- True
-----------------------------------------------
-- NO GUARDS ALLOWED IN CASE EXPRESSIONS !!!
-- use an if expression to cover for no guards 
-- ---------------------------------------------
-- case expression of  pattern -> result 
--                     pattern -> result
--                     pattern -> result
--                     ... 
describeList xs = "The list is " ++ case xs of []   -> "empty" 
                                               [x]  -> "a singleton list." 
                                               xs   -> "a longer list" 
describelist xs = "The list is " ++ what xs 
    where what [] = "empty. " 
          what [x] = "a singleton list. "
          what xs = "a longer list."     
