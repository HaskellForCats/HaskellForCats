module DataConsTypeCons where 
-- : set expandtab ts=2 ruler number spell
-- daw 

-- A data declaration introduces one or more type constructors and one or more value constructors for each of the type constructors.

-- A data constructor (or value constructor) can have zero or more arguments think of it as, a "function" that takes 0 or more values and gives you back a new value.

-- type constructor may have zero or more arguments, think of it, as a "function" that takes 0 or more types and gives you back a new type.

-- Data constructors are not types, they denote values. 

-- Tuples are plain old algebraic data types! 
-- They have only one constructor and have the same name as their types for convenience, this is possible because, type constructors and the data constructors have separate namespaces. 
-- deriving (Eq, Ord, Show, Read, Bounded, Enum)

data Colour = Red | Green | Blue
{- NOTE! when we ask for Colour's data type we get a "Not in scope" error. 
*DataConsTypeCons> :t Colour 
<interactive>:1:1: Not in scope: data constructor `Colour' 
*DataConsTypeCons> :i Colour 
data Colour = Red | Green | Blue 	-- Defined at 2014-0203ADT.hs:8:6

HOWEVER!
*DataConsTypeCons> :t Red 
Red :: Colour
*DataConsTypeCons> :i Red 
data Colour = Red | ... 	-- Defined at 2014-0203ADT.hs:8:15
-}

 
data Colour' = RGB Int Int Int deriving (Show)  
{- SAME AGAIN 
*DataConsTypeCons> :t Colour' 
<interactive>:1:1: Not in scope: data constructor Colour'
*DataConsTypeCons> :i Colour' 
data Colour' = RGB Int Int Int 	-- Defined at 2014-0203ADT.hs:17:6

*DataConsTypeCons> :t RGB
RGB :: Int -> Int -> Int -> Colour'
-}
data SBTree = Leaf String 
            | Branch String SBTree SBTree

data BTree a = LeAf a 
              | BrAnch a (BTree a) (BTree a) 
{-
Now we introduce a type variable a as a parameter to the type constructor. In this declaration, BTree has become a function. It takes a type as its argument and it returns a new type.

It is important here to consider the difference between a concrete type (examples include Int, [Char] and Maybe Bool) which is a type that can be assigned to a value in your program, and a type constructor function which you need to feed a type to be able to be assigned to a value. A value can never be of type "list", because it needs to be a "list of something". In the same spirit, a value can never be of type "binary tree", because it needs to be a "binary tree storing something".
-}
---------------------
-- NEWTYPE -- 
---------------------
-- think unique type-synonym. 

{------TypeCon--------------------
----------|-----------------------
----------|------DataCon-----------
----------|---------|--------------
----------|---------|---- Type Ref
----------|---------|-----|-------}
newtype CustId = MkCustId Int deriving (Show,Ord,Eq) 

  
{- checking our types in the console 

*DataConsTypeCons> :t MkCustId 
MkCustId :: Int -> CustId
*DataConsTypeCons> :t CustId 
<interactive>:1:1:
    Not in scope: data constructor `CustId'
    Perhaps you meant `MkCustId' (line 63)
*DataConsTypeCons> :i CustId 
newtype CustId = MkCustId Int 	-- Defined at 2014-0203ADT.hs:63:9

-- trying to define a CustId directly without the constructor we get  
CustId = 13 

2014-0203ADT.hs:64:1:
    Not in scope: data constructor `CustId'
    Perhaps you meant `MkCustId' (line 63)
*DataConsTypeCons> :t MkCustId 13

MkCustId 13 :: CustId

-- to be able to find a customer by Id 
-- we access it via the constructor
-} 

{------TypeCon--------------------
-------|--------------------------
-------|---------DataCon-----------
-------|-----------|---------------
-------|-----------|----- Type Ref
-------|-----------|--------|-----}
custIdViaInt (MkCustId i) = i 
 
{- from the console ... 

*DataConsTypeCons> :t custIdViaInt 
custIdViaInt :: CustId -> Int   
*DataConsTypeCons> :i custIdViaInt 
custIdViaInt :: CustId -> Int 	-- Defined at 2014-0203ADT.hs:90:1

-- note that i isn't in scope 
-- even though we did this assignment 
-- this is because this isn't a function
-- we are reverse constructing 
--                    <-------
-- custIdViaInt (MkCustId i) = i 
-- CustIds could only be made with MkCustIds
-- so we use MkCustIds to get back to 
-- CustIds 
-- this is much like pattern matching on Tuples 
-- but we a NOT calling a function 
-- constructor names often get conflated with type names 
-- because they two sides of a single coin 
-- one is meaningless without the other. 
*DataConsTypeCons> :i i

Top level: Not in scope: `i'
*DataConsTypeCons> :t i

<interactive>:1:1: Not in scope: `i'
-}

----------------
 --  RECORDS --
----------------
--    type   --    data 
--    cons   --    cons 
-- ----------------------- ref
-- ----------------------- type

data Customer   = MkCustomer 
  { customerId  :: Int      -- this has to be an Int because we didn't define it as a newtype already. 
  , name        :: String 
  , luckyNumber :: Int 
  } 

alice = MkCustomer 
  { customerId  = 13    
  , name        = "Alice"  
  , luckyNumber = 42 
  }
margret = MkCustomer 
  { customerId  = 14    
  , name        = "Margie"  
  , luckyNumber = 47  
  }
{-
*DataConsTypeCons> :t MkCustomer
MkCustomer :: Int -> String -> Int -> Customer
*DataConsTypeCons> :t customerId
customerId :: Customer -> Int
*DataConsTypeCons> :t customerId alice
customerId alice :: Int
*DataConsTypeCons>  customerId alice
13
*DataConsTypeCons>  customerId margret
14
-}
data Day = Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday deriving (Eq,Ord,Show,Read,Bounded,Enum) 
-- *DataConsTypeCons> Monday == Monday
-- True
-- *DataConsTypeCons> Monday < Tuesday
-- True

------------------------------
{- 	ALGEBRAIC DATA TYPES  	-- 
------------------------------
Note that Haskell constructors are just names that glue values together.-}  
{------TypeCon--------------------
-------|--------------------------
-------|---------DataCon-----------
-------|---------|---------------
-------|---------|--- arguments -- 
-------|---------|-------|-------------}
-- data Cust = MakeCustr CustId String Int 
-- the arguments are identifiable by position .
{- previously with newtypes we could have redefined the String and Int to be Unique types. 
*DataConsTypeCons> :t CustId 
<interactive>:1:1:
    Not in scope: data constructor `CustId'
    Perhaps you meant `MkCustId' (line 63)

*DataConsTypeCons> :i CustId 
newtype CustId = MkCustId Int 	-- Defined at 2014-0205ADT.hs:63:9
instance Eq CustId -- Defined at 2014-0205ADT.hs:63:50
instance Ord CustId -- Defined at 2014-0205ADT.hs:63:46
instance Show CustId -- Defined at 2014-0205ADT.hs:63:41


note that if we hadn't constructed CustId as a type 
then data Cust = MakeCustr Int String Int would be more ambiguous as we wouldn't know the luckyNumber vs the CustId as both would be Ints 
-} 
data Cust = MkCustr CustId String Int
-- to extract data we use pattern matching 
allison = Cust (MkCustr 23) "Allison" 4711 
  


