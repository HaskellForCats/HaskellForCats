module CusDataTyp where 
-- : set expandtab ts=2 ruler number spell
-- daw
-- 50 days of Haskell 
-- The use difference between Records and A.D.T.s -- 
-- -- to retrieve fields/info from: 
----- records use auto generated functions for retrieval   
-------- you can't extend them 
-------- names for fields have to be unique 
----- A.D.T.s use pattern matching. 
-------- no auto generation. 

--------------------
-- - NEWTYPES ------
--------------------

-- sort of key and value pairing 

-- -----Constructor-------------
-- ---------|--------Construction------
-- ---------|------------|------value ---

newtype CustomerId = CustomerId Int 
customer = CustomerId 13 
customerToInt (CustomerId i) = i 
-- 		Records  	  --

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
------------------
-- ANOTHER TAKE --
------------------
-- *CusDataTyp> let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- *CusDataTyp> guy
-- Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"

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

-- data Car = Car {company :: String, model :: String, year :: Int} deriving (Show) 
data Car a b c = Car { company :: a 
                     , model   :: b 
                     , year    :: c 
                     } deriving (Show) 


tellCar (Car {company = c, model = m, year = y}) = "This" ++ c ++ " " ++ m ++ "was made in " ++ show y 

-- *CusDataTyp> Car {company="Ford", model="Mustang", year=1967}
-- Car {company = "Ford", model = "Mustang", year = 1967}
stang = Car {company="Ford", model="Mustang", year=1967} 
-- *CusDataTyp> tellCar stang
-- "ThisFord Mustangwas made in 1967"

data Maybe a = Nothing | Just a 

data Vector a = Vector a a a deriving (Show)  
  
vplus :: (Num t) => Vector t -> Vector t -> Vector t  
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  
  
vectMult :: (Num t) => Vector t -> t -> Vector t  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
  
scalarMult :: (Num t) => Vector t -> Vector t -> t  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*n  
{-
data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     } deriving (Eq)  
-}
-- Use record syntax when a constructor has several fields and it's not obvious which field is which. 
------------------------------
{- 	ALGEBRAIC DATA TYPES  	-- 
------------------------------
 data Customer = MakeCustomer CustomerId String Int 
 :show bindings 

-}
-- data Customer = MakeCustomer CustomerId String Int  
{-
newtype CustName = CustNameStr Char  
newtype CustId = CustIdNum Int

data Customer = MakeCustomer CustName CustId 
-}










