module Factorial where

-- w/ pattern matching



factorial :: Double -> Double 
factorial 0 = 1
factorial x = x * factorial (x - 1)

------
factorial' :: Int -> Int
factorial' n | n < 2 = 1
factorial' n = n * factorial' (n - 1)

------

factorial'' n = foldl1 (*) [1..n]

mls5 n = foldl1 (*) [11..n]
