module D_conT_con where
-- : set expandtab ts=2 ruler number spell -- daw
-- starting again from scratch 
-- lowercase pretains to functions and their args and Titlecase refers to things pertaining to types 
-- NEWTYPE 

{-
newtype CustomerId = MakeCustomerId Int
-- *D_conT_con> :i CustomerId 
-- newtype CustomerId = MakeCustomerId Int
-- *D_conT_con> :i MakeCustomerId
-- newtype CustomerId = MakeCustomerId Int
-- because we are using the newtype constructor keyword both CustomerId and MakeCustomerId don't exist on their own. They aren't function. They are catagories, the way that Int and String are catagories of data. 
  


customer :: CustomerId
customer = MakeCustomerId 13 -- this explicitly turns an Int into a CustomerId 

-- to call up the customerId we use pattern matching
customerToInt :: CustomerId -> Int

-- the pattern uses the MakeCustomerId Constructor with an argument of i
customerToInt (MakeCustomerId i) = i 
-}
-- it is often seen where the TypeCons and the DataCons both share the same name. 
newtype CustomerId = CustomerId Int 
customer = CustomerId 13 
customerToInt (CustomerId i) = i

-- *D_conT_con> :t customer
-- customer :: CustomerId
-- *D_conT_con> :t customerToInt 
-- customerToInt :: CustomerId -> Int  

-- ADT -- Algebraic Data Types
-- note the everything below is in Title Case which means it pertains to categories and not functions 


-- data Customer = MakeCustomer CustomerId String Int 
-- MakeCustomer is just a name with some associated values: CustomerId String Int 
-- MakeCustomer take a CustomerId and a String which will be used for a name, and an Int which will be the lucky number. 
-- These arguments are not identified by a field name like with records but are only identified by their position like function arguments.
-- As noted before the TypeCons and the DataCons can share the same name since they have separate name spaces. 
-- these are somewhat like newtypes but can take multiple arguments. 
-- ADT are especially helpful where a tuples contents doesn't have any semantic meaning  
data Customer = Customer CustomerId String Int
alice = Customer (CustomerId 13) "Alice" 42 
-- *D_conT_con> :t alice 
-- alice :: Customer
-- alice has CustomerId 13 and name "Alice" and a LuckyNumber 42 
-- to get at the data we use pattern matching  
{-
getCusomerId (Customer cust_id name luckyNumber) = cust_id 
-}
-- *D_conT_con> :t getCusomerId 
-- getCusomerId :: Customer -> CustomerId 
-- getCustomerId is a function the takes an entire tuple (Customer cust_id name luckyNumber)
-- where Customer is the item and cust_id, name, and luckyNumber are all attributes of Customer. 
-- With those arguments it can return a value for cust_id. 
-- Since were are not interested in all the attributes be can use wild-cards to reduce boiler plate. 
getCusomerId (Customer cust_id _ _) = cust_id 
---------------------------------------------
data StringTree = StringTree String [StringTree] 
-- the StringTree datacons has two args String and a list of [StringTree] 
-- this datatype will represent a tree 
-- where each node is labled by a string, which is how we organize a file structure. 
hierarchy = StringTree "C:" 
                  [ StringTree "Program Files" [] 
                  , StringTree "Users" 
                      [StringTree "Alice" []]
                  , StringTree "Cats" [] 
                  ] 
-- note the similar structure to the records we worked with before but where {} is replaced by []. 

-- see illustration in file StringTree.jpg  

----------------------------------------------

-- data {-# CTYPE "HsBool" #-} Bool = False | True
-- this is how the Bool Datatype is actually defined in GHC.Types. 
{-
*D_conT_con> let x = False 
*D_conT_con> let y = True 
*D_conT_con> x
False
*D_conT_con> y
True
*D_conT_con> :t x 
x :: Bool
*D_conT_con> :t y 
y :: Bool

data Bool has two constructors False and True. 

negate can be defined as 
negate :: Bool -> Bool 
negate True  = False 
negate False = True 
-} 
-- this kind of type is called and Enum 
-- as in Enumerable, which can be Ordered, such that it corresponds to positive integers and can therefore be counted, which is more than just ordering, which only requires that each element knows of it's adjacent element.  
data DialogResponse =  Yes|No|Help|Quit 
----------------------------------------
-- Algebraic DataTypes can have constructors that take multiple arguments. 
data MaybeInt = NoInt | JustInt Int 
-- here we have an Int value that could be present but doesn't have to be, 
-- thus we can represent a null-able value.
-- furthermore we find out if a value exists and extract it if it does. 
defaultInt :: Int -> MaybeInt ->Int 
defaultInt defaultValue NoInt = defaultValue 
defaultInt _ (JustInt  x) = x 
----------------------------------------
data StringList = EmptyStringList 
                | ConsStringList String StringList deriving (Eq,Ord,Show,Read) 
-- with this Algebraic DataType we have defined the emplty list of Strings 
-- the head of the list of Strings and the tail of the list of Strings.
lengthStringList :: StringList -> Int 
lengthStringList EmptyStringList = 0 
lengthStringList (ConsStringList _ xs) = 1 + lengthStringList xs 
-- note that so far we can compile this but can't prove this
{-- other than the renaming the above is the same as: 
length :: [a] -> Int 
length [] = 0 
length (_ : xs) = 1 + length xs -}  
------------------------------------------
 
