module TClasses where
-- : set expandtab ts=2 ruler number spell -- daw
-- : syntax enable 
---------------------------
-- Type Class Instances 
-- Instances 
-- Deriving 
-- Defining type classes 
-- Subclasses 
----------------------------
-- Type Class Instances  
-- 	Instances where we can add on instances to extend Type Classes further
-- 	with deriving we can add in these instances in obvious ways rather than by definition by definition 
-- 



el2m :: Eq a => a -> [a] -> Bool
el2m _ [] = False 
el2m x (y:ys)   
  | x==y = True 
  | otherwise = el2m x ys
 
-- Haskell doesn't have a built in equality test for functions it would have to be added.
-- Functions don't have built in equality tests. 
-- but we can have a known answer test (KAT)
-- to test for equality between colors 
-- we have to create an instance of equality for our RGB type. 
data RGB = RGB Int Int Int 
-- > :t RGB
-- RGB :: Int -> Int -> Int -> RGB
instance Eq RGB where 
  (RGB r1 g1 b1) == (RGB r2 g2 b2) = 
    (r1 == r2) && (g1 == g2) && (b1 == b2) 

instance Show RGB where 
  show (RGB r g b) = 
    "RGB " ++ (show r) ++ "  " ++ (show g) ++ " " ++ (show b)  
colors = [RGB 255 0 0, RGB 0 255 0, RGB 0 0 255] 
green = RGB 0 255 0 
greenInColors = elem green colors 
-- *TClasses> elem green colors 
-- True
-- *TClasses> show (RGB 255 255 255) 
-- "RGB 255  255 255"



data Mayb2 a = Nothing' | Just' a  
-- because Mayb2 a is defined with an Eq type no matter what a is; 
-- x == y have values of type a and will always be equal, whoops! 
-- => is the context of the type-class instance 
-- and parameterized Types might require additional constraints  
-- for simple things this is straight forward 
-- but more complex examples will require knowing about the "context instance".
-- we've had to add an instance here 
instance (Eq a) => Eq (Mayb2 a) where 
  Nothing' == Nothing' = True 
  Nothing' == (Just' _) = False 
  (Just' _) == Nothing' = False 
  (Just' x) == (Just' y) = x == y 

data Person = Person String Int Int 
instance Eq Person where 
  (Person name1 age1 height1) == (Person  name2 age2 height2) = 
    (name1 == name2) && (age1 == age2) && (height1 == height2) 
-- so that we don't have to do this for every Type constraint we can use the keyword deriving

-- data RGB' = RGB Int Int Int 
--  deriving Eq 

---------------------------
----  deriving  -----------
---------------------------
-- only legal addtions are possible 
-- deriving adds on  obvious  type-classes like 
        -- Eq where each component == component 
        -- Ord where (<),(>),(<=),(>=) component to component
        -- Show gives us show "component"
        --                      "[Constructor-name] {argument-1} {argument-2}..." 
        -- Read which gives the read function 
        --    Deriving-parse output of default show 

-- Minimum complete definitions
-- must be satisfied     
{-
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
        -- Defined in `GHC.Classes'
        -- Default definitions 
-- we create new type classes when to not have them would require excessive amounts of definitions 
-- to get polymorphic functionality on a given function. 

-- Subclasses work as refinements on the Superclass. Eq just allows for comparison where as Ord which inherits from Eq allows other comparisons (<),(>),(<=),(>=) which would not be possible to do with out first checking if two elements were the same or not. 
{-
class Eq a => Ord a where
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a
  	-- Defined in `GHC.Classes'
-} 
-- note that the Class definition class Eq a => Ord a where shows that Ord is a Subclass of Eq. 
-- compare :: a -> a -> Ordering
-- note that ordering is defined thus...  
-- data Ordering = LT | EQ | GT 	-- Defined in `GHC.Types'


{-
class (Num a, Ord a) => Real a where
  toRational :: a -> Rational
  	-- Defined in `GHC.Real'
-} 

 
