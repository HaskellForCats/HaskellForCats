-- module FuncCall where 
{- 
Prelude> sqrt 5
2.23606797749979

Prelude> sqrt 25
5.0

Prelude> max 1.3 4 
4.0

Prelude> max (5 + 2) (sqrt 17)  
7.0

Prelude> (5 + 2) * (3 - 4)   
-7

Prelude> let square x = x * x 

Prelude> square 3 
9

Prelude> :t square 
square :: Num a => a -> a

Prelude> :t square 3.3
square 3.3 :: Fractional a => a

Prelude> :t square 3/5
square 3/5 :: Fractional a => a

Prelude> square 3/5
1.8

Prelude> square 3.5 
12.25

-- let tells the ghc that we are creating something new, and not asking for something that is in it's namespace. 



-}
multi a b x = (max a b) * x 


-- Prelude> :l 2014-0226funcCal.hs 
-- [1 of 1] Compiling Main             ( 2014-0226funcCal.hs, interpreted )
-- Ok, modules loaded: Main.
-- *Main> :q
-- Leaving GHCi.

-- Prelude> :l 2014-0226funcCal.hs 
-- [1 of 1] Compiling Main             ( 2014-0226funcCal.hs, interpreted )
-- Ok, modules loaded: Main.
-- 
-- *Main> multi 4 5 6
-- 30 


