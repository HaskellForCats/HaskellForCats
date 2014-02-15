module Lambda where 
import Prelude hiding (zipWith,flip,sum,elem,map) 
chain :: (Integral a) => a -> [a]  
chain 1 = [1]  
chain n  
    | even n =  n:chain (n `div` 2)  
    | odd n  =  n:chain (n * 3 + 1)  
-- Lambdas are anonymous functions, for when we need a function only once. 
-- Most likely we just pass it to a higher-order function 
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100])) 

-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-- Prelude> zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
-- [153.0,61.5,31.0,15.75,6.6]


-- *Lambda> map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)] 
-- [3,8,9,8,7]

addThree = \x -> \y -> \z -> x + y + z 
-- *Lambda> addThree 3 4 6
-- 13 

flip f = \x y -> f y x 

sum xs = foldl (\acc x -> acc + x) 0 xs 

-- or better yet

sum' :: [Integer] -> Integer
sum' = foldl (+) 0 

elem :: Eq a => a -> [a] -> Bool
elem y ys = foldl (\acc x -> if x == y then True else acc) False ys 

map :: (a -> a1) -> [a] -> [a1]
map f xs = foldr (\x acc -> f x : acc) [] xs 
