module YesNo where 
class YesNo a where 
	yesNo :: a  -> Bool  
instance YesNo (Tree a) where 
	yesNo EmptyTree = False 
	yesNo _ 		= True 

