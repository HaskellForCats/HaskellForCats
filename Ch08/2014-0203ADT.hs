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
----------------
 --  RECORDS --
----------------
--    type   --    data
--    cons   --    cons 



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
