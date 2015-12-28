{-# LANGUAGE NPlusKPatterns #-}
module Fib where 
import Test.QuickCheck
-- foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-- myFib 6 == fib 6
myFib :: Integer -> Integer 

myFib 0 = 0 
myFib 1 = 1 
myFib n = (myFib (n - 1) + myFib (n - 2))  
      


grahamFib :: Integer -> Integer 
grahamFib 0 = 0 
grahamFib 1 = 1
grahamFib (n + 2) = grahamFib n + grahamFib (n + 1) 


-- prop_fibs xs      = grahamFib xs == myFib xs 