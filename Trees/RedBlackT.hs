module RedBlackT where

data Color = Red | Black deriving (Eq, Ord, Show, Read) 

data RedBlackTree a = RBTNode a Color (RedBlackTree a) (RedBlackTree a)
                            | RBTEmpty deriving (Ord, Eq, Show, Read) 

rbtLeftChild (RBTNode _ _ l _) = l

rbtRightChild (RBTNode _ _ _ r) = r

rbtValue (RBTNode v _ _ _) = v 

rbtColor (RBTNode _ c _ _) = c 
rbtColor RBTEmpty = Black 

rbtInsert node v = rbtInsertTailCall node v [] 

rbtInsertTailCall node@(RBTNode v color left right) newval path 
                | v > newval = rbtInsertTailCall left newval (node:path) 
                | otherwise = rbtInsertTailCall right newval (node:path) 
rbtInsertTailCall RBTEmpty v path = rbtRebalance (RBTNode v Red RBTEmpty RBTEmpty) path 

rbtPivotRight (RBTNode rootval rootcolor (RBTNode focval foccolor focleft))

rbtRebalance (RBTNode v _ left right) (parent@(RBTNode pv pc pl))
                | pv >  v = RBTNode pv pc node pr 
                | otherwise = RBTNode pv pc pl node 