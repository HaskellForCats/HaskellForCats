module Factorial where

-- w/ pattern matching

-- factorial :: Double -> Double -- forcing the type

factorial 0 = 1
factorial x = x * factorial (x - 1)

------

factorial' n | n < 2 = 1
factorial' n = n * factorial' (n - 1)

------

factorial'' n = foldl1 (*) [1..n]


