module BiTree01 where 
-- import Tree  
-- data Tree a = Nil | Node Int a  (Tree a) (Tree a) deriving (Eq, Ord, Show, Read)

data Tree a = Nil | Node Int (Tree a) a (Tree a) deriving (Eq, Ord, Show, Read)

depth :: Tree t -> Int
depth Nil               = 0
depth (Node _  t1 n t2)    = 1 + max (depth t1) (depth t2) 

collapse :: Tree t -> [t]
collapse Nil            = [] 
collapse (Node _ t1 x t2) = collapse t1 ++ [x] ++ collapse t2

mapTree :: (t -> a) -> Tree t -> Tree a
mapTree f Nil = Nil 
mapTree f (Node w t1 x t2) = Node w  (mapTree f t1) (f x) (mapTree f t2)   

weight :: Tree a -> Int 
weight Nil = 0 
weight (Node w _ _ _) = w 

node :: (Tree a) -> a -> (Tree a) -> Tree a 
node l x r = Node (1 + weight l + weight r) l x r
-- node l x r = Node (1 + weight l + weight r) l x r

{-
rotateRight :: Tree a -> Tree a
rotateRight  (Node w (Node w' a b c) d e) = Node w a b (Node w' c d e)
rotateRight x = x

isMem :: a -> Tree a -> Bool 
isMem = undefined
-}
-- trees are ordered data structure 
-- Sets in Haskell are tree based and therefore ordered 
-- HashedSets are unordered 
-- O-log-n cost -- left of right rotation swaping out root position recursively to balance out the tree so as reduce the ceiling on the amount of work to reach each node -- slow better than crash 

-- HashTables -- inserts Eq O-n time  -- 
-- HashFunction computes 


-- to keep track of weight -- Right subtree shouldn't have more than 2 times more than Left and it's inverse.  

-- weight balacing is simple to think about 
-- height max steps to empty tree Empty = 0 -- (weight of two subtrees + 1) 
-- height Empty tree = 0 
-- height non-Empty (1 + max height of two subtrees) - restrict height of Subtree to be no more than one. 

-- function that takes two subTrees and a Root and calculate a Node -- favoring weight over height 
-- think of a contructor as named duples 

