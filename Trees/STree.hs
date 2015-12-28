module STree where 

data  STree a = Nil | Node (STree a) a (STree a) deriving (Eq,Ord,Read,Show) 

findtree Nil x = False 
findtree (Node tleft y tright) x 
    | x == y    = True 
    | x < y     = findtree tleft x
    | otherwise = findtree tright x 

inserttree Nil x = Node Nil x Nil
inserttree (Node tleft y tright) x 
    | x == y    = Node tleft y tright 
    | x < y     = Node (inserttree tleft x) y tright 
    | otherwise = Node tleft y (inserttree tright x)

deletemax (Node t1 y Nil)   = (y,t1)
deletemax (Node t1 y t2)    = (z, Node t1 y tz) 
    where (z,tz) = deletemax t2 

deletetree Nil x = Nil 
deletetree (Node tleft y tright) x 
    | x < y     = Node (deletetree tleft x) y tright 
    | x > y     = Node tleft y (deletetree tright x)
deletetree (Node Nil y tright) x    = tright 
deletetree (Node tleft y tright) x  = rebalance (Node tz z tright)
                                     where (z,tz) = deletetree tleft 

inserttree' Nil x       = Node Nil x Nil 
inserttree' (Node tleft y tright) x 
    | x == y            = Node tleft y tright 
    | x < y             = rebalance (Node (inserttree' tleft x) y tright) 
    | otherwise         = rebalance (Node tleft y (inserttree' tright x))

rebalance (Node t1 y t2) 
    | abs (sy) < 2      = Node t1 y t2 
    | sy == 2 && st1 /= -1  = rotateright (Node t1 y t2) 
    | sy == 2 && st1 == -1  = rotateright (Node (rotateleft t1) y t2) 
    | sy == -2 && st2 /= -1 = rotateleft  (Node t1 y t2)
    | sy == -2 && st2 == 1  = rotateleft (Node t1 y (rotateright t2)) 
                            where 
                                sy  = slope (Node t1 y t2)
                                st1 = slope t1 
                                st2 = slope t2 
                                rotateright (Node (Node t1 y t2) x t3)  = Node t1 y (Node t2 x t3) 
                                rotateleft  (Node t1 x (Node t2 y t3))  = Node (Node t1 y t2) x t3 

slope Nil = 0 
slope (Node t1 x t2) = (height t1) - (height t2) 

height Nil =  0
height (Node t1 x t2) = 1 + (max (height t1)) (height t2)

height Nil = 0 
height (Node m t1 x t2) = m 