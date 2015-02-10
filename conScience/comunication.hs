module HalfAdder where

-- main = putStrLn "Hello World"
import Prelude hiding (and,or)

{-
comunication 
	and maybe verification 

	Classic
		Action



		OODA Loop 
			Observe 
			Orient 
			Decide 
			Act 

Haskell 
	Xor and And
-}

--main :: IO()
--main = undefined 
-----------------
-- HALF ADDER -- 

data Bit = High | Low 

-- knowing about the domain 
-- mimicing test driven development
-- halfAdder :: Bit -> Bit -> (Bit,Bit)
-- halfAdder = undefined 

halfAdder inputOne inputTwo = (inputOne `xor` inputTwo, inputOne `and` inputTwo)

xor High Low = High
xor Low High = High 
xor _ _		 = Low 

-- and High Low = Low 

and High High = High
and _ 	_ 	= Low

------------------ 	
-- FULL ADDER ----

fullAdder :: Bit -> Bit -> Bit -> (Bit,Bit)
-- fullAdder = undefined 
fullAdder inputOne inputTwo carryin = (sumOutputT)



-- could I have saved a s-ton of time by just using a newType? 