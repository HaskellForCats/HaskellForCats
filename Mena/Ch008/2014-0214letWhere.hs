module LetWhere where 
----------------------
-- LET BINDINGS -----
-- are bottom up ----- 
-- -------------------
-- let bindings as like variable assignments but they are more permanent and they scope things nicely. 
-- this fancySeven doesn't do much but shows how we can assign values  
fancySeven :: Integer
fancySeven = 
  let a = 3       -- let keyword start the binding  
  in 2 * a + 1 
-- our function only return us a 7 cause there were no inputs from us they were already given. 
-- *LetWhere> fancySeven
-- 7
fancy9 = 
  let x = 4
      y = 5 
  in x + y 
-- *LetWhere> fancy9
-- 9
removeOdd [] = [] 
removeOdd (x:xs) 
  | mod x 2 == 0  = x : (removeOdd xs) 
  | otherwise     = removeOdd xs 

numEven :: Integral a => [a] -> Int
numEven nums = 
  let evenNums = removeOdd nums 
  in length evenNums
-- *LetWhere> numEven [1..33]
-- 16
--
------------------------------------------------------------------
-- where bindings must be associated with a function definition --
-- top down 
-- ---------------------------------------------------------------
fancyNine = x + y 
    where x = 4 
          y = 5
-- *LetWhere> fancyNine
-- 9 
-- fancy10 = 2 * (a + 1 where a = 4) 
-- parse error on input `where'
fancyTen = 2 * (let a = 4 in a + 1)
-- *LetWhere> fancyTen
-- 10
cylinder :: Floating a => a -> a -> a
cylinder r h = 
    let sideArea = 2 * pi * r * h 
        topArea = pi * r ^ 2 
    in sideArea + 2 * topArea


