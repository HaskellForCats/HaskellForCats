module LearnCh2 where 
import Data.List
import Data.Ix
removeUppercase st = [ c | c <- st, c `elem` ['a'..'z']]

-- addThree :: Num a => a -> a -> a -> a 
addThree x =  \y -> \z -> x + y + z 

mylength = fromIntegral (length [1,2,3,4]) + 3.2

mylength' = (genericLength [1,2,3,4]) + 3.2

