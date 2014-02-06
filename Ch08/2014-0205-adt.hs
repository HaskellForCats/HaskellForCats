module Datcontypcon where
-- : set expandtab ts=2 ruler number spell -- daw
-- starting again from scratch 
-- lowercase pretains to functions and their args and Titlecase refers to things pertaining to types 
-- NEWTYPE 

{-
newtype CustomerId = MakeCustomerId Int
-- *Datcontypcon> :i CustomerId 
-- newtype CustomerId = MakeCustomerId Int
-- *Datcontypcon> :i MakeCustomerId
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

-- *Datcontypcon> :t customer
-- customer :: CustomerId
-- *Datcontypcon> :t customerToInt 
-- customerToInt :: CustomerId -> Int  

-- ADT -- Algebraic Data Types
-- note the everything below is in Title Case which means it pertains to categories and not functions 


-- data Customer = MakeCustomer CustomerId String Int 
-- MakeCustomer is just a name with some associated values: CustomerId String Int 
-- MakeCustomer take a CustomerId and a String which will be used for a name, and an Int which will be the lucky number. 
-- These arguments are not identified by a field name like with records but are only identified by their position like function arguments.
-- As noted before the TypeCons and the DataCons can share the same name since they have separate name spaces.  
data Customer = Customer CustomerId String Int 
