module Lambda where 
-- Lambdas are anonymous functions, for when we need a function only once. 
-- Most likely we just pass it to a higher-order function 
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100])) 


