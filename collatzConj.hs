-- collatzConj.hs
{- Take any natural number n. If n is even, divide it by 2 to get n
If n is odd, multiply it by 3 and add 1 to obtain 3n + 1
Repeat the process (which has been called "Half Or Triple Plus One"
The conjecture is that no matter what number you start with,
you will always eventually reach 1. The property has also been called oneness. -}

module Collatz where 

collatz []  = []  

  
collatz (x:xs) = 
				let odds = [((a*3)+1) | a <- xs]
				    evens = [a|a <- xs]
				in collatz odds ++ [x] ++ evens 

	


-- collatz [x] = (3*x)+1  


			

						