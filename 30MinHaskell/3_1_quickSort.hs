module QuickSort where 
	
-- f :: Ord t => [t] -> [t]
f [] 		= []

f (x:xs)        = f ys ++ [x] ++ f zs 
                  where 
                        ys = [a | a <- xs, a <= x ] 
                        zs = [b | b <- xs, b > x ]

{- !!   note:   xs means list [] 
                ys means a list 
                zs means another list
                x: is the act of conjoining onto a list.
                f  means function z\
				[b | b <- xs, b > x ] -- list comprehension
-------------
f [1,7,4,2,0]
f ['1','7','4','2','0']
f ['1','7','4','2','a','Z']
-}   
                 
