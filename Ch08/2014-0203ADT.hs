module DataConsTypeCons where 
-- : set expandtab ts=2 ruler number spell
-- daw
-- 50 days of Haskell 



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

