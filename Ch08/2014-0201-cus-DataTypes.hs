module CusDataTyp where 
-- : set expandtab ts=2 ruler number spell

-- 47 days of Haskell 

-- TYPE SYNONYMS 

type MyStrings = [Char] 
type Point = (Double,Double)
-- in the compiler (Double,Double) and Point can be swapped around 
--
p1 :: (Double,Double)
p1 = (1,2) 

p2 :: Point 
p2 = (3,4) 

{-
*CusDataTyp> :i p1
p1 :: (Double, Double)
        -- Defined at 2014-0131-cus-DataTypes.hs:11:1
*CusDataTyp> :i p2
p2 :: Point     -- Defined at 2014-0131-cus-DataTypes.hs:14:1

*CusDataTyp> :i Point
type Point = (Double, Double)
        -- Defined at 2014-0131-cus-DataTypes.hs:7:6


BUT THIS IS INCONSISTENT USE NEWTYPES INSTEAD 

-}

---- NEWTYPES ------
-- sort of key and value pairing 
--------Constructor-------------
---------------------Construction------
-----------------------------------value
newtype CustomerId = CustomerId Int 

customer = CustomerId 13 

customerToInt (CustomerId i) = i 

-- Constructor Names often match the Type Names. 
-- Newtypes make unique types from existing ones
-- This enforces semantic meaning through the type checker. 
data Customer   = MakeCustomer 
  { customerId    :: CustomerId 
   , name         :: String 
   , luckyNumber  :: Int 
   } 

alice :: Customer 
alice = MakeCustomer 
  { customerId    = CustomerId 13 
  , name          = "Alice" 
  , luckyNumber   = 42 
  } 
 

