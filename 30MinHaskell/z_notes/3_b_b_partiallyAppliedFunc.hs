module PartApply where 
-- :  set expandtab ts=4 ruler number spell
-- functions that seem to take multiple parameters 
-- are actually taking a single parameter and 
-- returning a partially applied function. 
-- We can just partially apply a function to the point 
-- where it takes only one parameter and then 
-- pass it to completion. 
{-
	|	x  	= x (x*x) 
	|	x y 	= x (x*y) -} 
partApp0 x y z	= (/) (product(x:(y:(z:[]))))  (sum(x:(y:(z:[]))))  
partApp1 x y z = (+) x (y+z) 
   
