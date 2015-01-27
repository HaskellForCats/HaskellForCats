-- IOMonad.hs
module IO where 

-- import Data.Map as M
-- import System.IO as S 

-- flatMap = [1,7,11] (\x -> [x,x+1])

addM000 mx my = 
	mx >>= (\x -> my >>= (\y -> return (x + y)))

addM001  mx my  = do 
	x <- mx
	y <- my 
	return (x+y)

people = ["Alice","Bob","Evie"]
items  = ["car","puppy"] 
missing = do 
	person  <- people
	item 	<- items
	return  (person ++ " lost a " ++ item) 
