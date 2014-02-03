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


-- - NEWTYPES ------
-- sort of key and value pairing 

-- -----Constructor-------------
-- ---------|--------Construction------
-- ---------|------------|------value ---
newtype CustomerId = CustomerId Int 

customer = CustomerId 13 

customerToInt (CustomerId i) = i 

-- 		Records  	  --
-- *CusDataTyp> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- *CusDataTyp> guy
-- Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

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

-- data Person = Person String String Int Float String String deriving (Show)  
data Person = Person    { firstName :: String 
                        , lastName :: String 
                        , age :: Float 
                        , height :: Float 
                        , phoneNumber :: String 
                        , flavor :: String 
                        } deriving (Show) 
                        
-- The main benefit instant created functions 
-- that lookup fields in the data type. 
-- By using record syntax to create this data type, 
-- Haskell automatically made these functions: 
-- firstName, lastName, age, height, phoneNumber and flavor.

-- *CusDataTyp> :i age
-- data Person = Person {..., age :: Float, ...}

data Car = Car {company :: String, model :: String, year :: Int} deriving (Show) 

-- *CusDataTyp> Car {company="Ford", model="Mustang", year=1967}
-- Car {company = "Ford", model = "Mustang", year = 1967}


  
-- Use record syntax when a constructor has several fields and it's not obvious which field is which. 

{- 	ALGEBRAIC DATA TYPES  	-- 
 data Customer = MakeCustomer CustomerId String Int 
 :show bindings 

-}
-- data Customer = MakeCustomer CustomerId String Int  
{-
newtype CustName = CustNameStr Char  
newtype CustId = CustIdNum Int

data Customer = MakeCustomer CustName CustId 
-}









