module BiTree01 where 
import Tree  
data Tree a = Nil | Node a (Tree a) (Tree a) deriving (Eq, Ord, Show, Read)

depth Nil               = 0
depth (Node n t1 t2)    = 1 + max (depth t1) (depth t2) 

collapse Nil            = [] 
collapse (Node x t1 t2) = collapse t1 ++ [x] ++ collapse t2 

mapTree f Nil = Nil 
mapTree f (Node x t1 t2) = Node (f x) (mapTree f t1) (mapTree f t2)   

 