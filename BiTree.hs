module BiTree where 

import qualified Data.Map.Strict as Map

-- data in Branch
data Tree a = 
	Branch (Tree a) a (Tree a) 
	| Leaf 
-- Data in Leaf 

data Tree' b = 
	Branch' (Tree' b) (Tree' b) 
	| Leaf' b 

-- Choice Tree 
data Tree'' b = 
	Branch'' (Tree'' b) (Tree'' b) 
	| Emit b (Tree'' b)
	| Leaf'' b 