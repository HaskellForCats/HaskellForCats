module Ch2Probs where 

{----1-----------
*Ch2Prob> (2^3)*4
32
*Ch2Prob> 2^3*4
32
*Ch2Prob> (2^3*4)
32
*Ch2Prob> 2^(3*4)
4096
------2---------
*Ch2Prob> 2*3 + 4*5
26
*Ch2Prob> 2*(3 + 4)*5
70
*Ch2Prob> (2*3 + 4)*5
50
*Ch2Prob> 2*(3 + 4*5)
46
-------3----------
*Ch2Prob> 2+3*4^5
3074
*Ch2Prob> (2+3*4)^5
537824
*Ch2Prob> 2+3*(4^5)
3074
*Ch2Prob> (2+3)*4^5
5120
*Ch2Probs> 2+(3*4)^5
248834

-}

-- 2.3 Function application 

        
        f               = \a -> b+c*d
                          where 
                                 
                                b = 7
                                c = 8
                                d = 9
{-       f               :: a -> Integer  
 -       f               :: a -> Int    
 -       f               :: a -> Float
 -       f               :: a -> Double   
 -      
        n               = a `div` length xs
	                        where
	                        a = 10
	                        xs = [1, 2, 3, 4, 5]
-}
        double x        = x+x
        quadruple x     = double(double x)
{-
        
*Ch2Probs> take (double 2) [5,4,3,2,1,0]
[5,4,3,2]

-}
        average ns      = sum ns `div` length ns

-- *Ch2Probs> average  [5,4,3,2,1,0]
-- 2


        factorial n     = product[1..n]

-- lib function "last", that takes last element from a [xs] list. 

        astL xs         = [xs!!x|x <-[(length xs)-1]]
        asTL xs         = concat ([drop x xs| x <-[(length xs)-1]]) 
 -- [xs!!((length xs)-1)]                    
-- [[5,4,3,2,1,0]!!x|x <-[(length[5,4,3,2,1,0])-1]]       
-- Prelude> astL [5,4,3,2,1,0]
-- [0]

-- redo init 
-- in 2 different ways.
     
-- concat[(take x [5,4,3,2,1,0])|x <-[(length[5,4,3,2,1,0])-1]]
        nitI xs         = take ((length xs)-1)xs
-- Prelude> niti [5,4,3,2,1,0]
-- [5,4,3,2,1]

