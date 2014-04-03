module Ch10Types where 

type Pos = (Int,Int) -- type synonym 

origin  :: Pos 
origin = (0,0) 

left    :: Pos -> Pos 
left (x,y) = (x-1,y) 
-- *Ch10Types> left (1,1) 
-- (0,1)

----------------------

type Pair a = (a,a) 

mult :: Pair Int -> Int 
mult (m,n) = m * n 

copy :: a -> Pair a 
copy x  = (x,x)  


-- *Ch10Types> copy (1,1)
-- ((1,1),(1,1))
-- *Ch10Types> mult (1,1)
-- 1

-- type level           value level 
-----------------------------------
-- Pair Int       | pair a 
--     =          |    = 
-- (Int,Int)      | (a,a)
--                |
-- type Pair a =  | pair 13 
--     =          |    = 
-- (a,a)          | (13,13) 
--                |
-- syntax         | syntax 
-- of             | of  
-- types          | values

-- Erik predicts that by about now Haskell will have evolved into a fully dependent type language where types and terms are fully intertwined. 


