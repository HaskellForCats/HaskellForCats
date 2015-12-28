module Tree 
		(Tree,
		nil,
		isNil, 
		isNode, 
		leftSub, 
		rightSub,
		treeVal, 
		insTree, 
		delete, 
		minTree
		) where 

insTree val Nil = (Node val Nil Nil)

insTree val (Node v t1 t2)
	| v == val  = Node v t1 t2 
	| val > v 	= Node v t1 (insTree val t2)
	| val < v 	= Node v (insTree val t1) t2 

delete val (Node v t1 t2)
	| val < v 	= Node v (delete val t1) t2 
	| val > v 	= Node v t1 (delete val t2) 
	| isNil t2 	= t1 
	| isNil t1 	= t2 
	| otherwise = join t1 t2 

minTree t 
	| isNil t 	= Nothing 
	| isNil t1 	= Just v 
	| otherwise = minTree t1 
		where 
			t1 	= leftSub t 
			v 	= treeVal t 
join t1 t2 = Node mini t1 newt 
			where 
			(Just mini) = minTree t2 
			newt 		= delete mini t2 

nil = Nil 

isNil Nil 	= True 
isNil _ 	= False 

isNode Nil 	= False 
isNode _ 	= True 

leftSub Nil = error "leftSub" 
leftSub (Node _ t1 _ ) = t1 

rightSub Nil = error "rightSub"
rightSub (Node _ _ t2) = t2 

treeVal Nil 	= error "treeVal" 
treeVal (Node v _ _ ) 	= v 

