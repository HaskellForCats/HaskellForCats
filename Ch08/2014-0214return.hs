module Ch08.Return where 
import Prelude hiding (maximum) 
-- import Mod hiding (x,y)
-- : syntax enable  --  :set linebreak expandtab ruler 
-- ISSUE: wanting to return more than one value in a funtion. In other Languages we would creat a datatype that accepts this. Tuples are useful enough in simple cases otherwise a larger more complex datatype would be needed. 
-- Haskell likes all elements of the same block to start in the same column. 
-- 

maximum list = 	let h = head list 
                in if null (tail list) 
		then (h, h) 
			else 	(if h > t_max then h else t_max 
				,if h < t_min then h else t_min ) 
				where 	t = maximum (tail list) 
					t_max = fst t 
					t_min = snd t  
