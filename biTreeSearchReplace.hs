-- biTreeSearchReplace.hs
module BiTreeSearch where 
import Control.Applicative
import Data.Monoid 
import Data.Tuple
import Control.Applicative

data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
            deriving (Show, Eq)

-- foldTree = foldr (\x tree -> insertInTree x tree) Leaf 
foldTree = foldr (\x tree -> insertInTree x tree) Leaf 
 
insertInTree x Leaf = Node 0 (Leaf) x (Leaf) 
insertInTree x (Node n t1 val t2) = if h1 < h2 
						then Node (h2 + 1) (insertInTree x t1) val t2 
						else Node (h1 + 1) t1 val (insertInTree x t2)
						where  	
								h1 = heightTree t1 
								h2 = heightTree t2 
heightTree Leaf = 0 
heightTree (Node n t1 val t2) = n 

-- foldTree "ABCDEFGHIJ"
-- mytree = [5,[3,[1,4]],7]
-- giveTree1 = (2,(1),(6,(4,))))
-- givenTree1 = ('b',('a'),'f',('d','c','e')'g')
-- getFirst'  = ()  
