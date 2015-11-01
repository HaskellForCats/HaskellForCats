
module LearnCh3 where 
-- import Data.List
-- import Data.Ix
import Math.Factorial 
--lucky :: (Eq a, Num a) => a -> [Char]

lucky 7 = "LUCKY NUMBER SEVEN!" 
lucky 6 = "Six is great number of eggs"
lucky x = "Sorry, you're out of luck, pal!"
---------------------------------



factorial' :: (Num a, Ord a) => a -> a 
factorial' x 
    | x <= 1 = 1 
    |otherwise = x * factorial' (x - 1) 

addVectors a b = (fst a + fst b, snd a + snd b)

vectorList xs = [a+b | (a, b) <- xs]
                -- where xs = [(1,3),(4,3),(2,4),(5,3),(5,6),(3,1)]

tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x  ++ " and " ++ show y

firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell weight height
            | bmi <= skinny = "You're underweight, you emo, you!"
            | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
            | bmi <= fat    = "You're fat! Lose some weight, fatty!"
            | otherwise     = "You're a whale, congratulations!"
            where bmi = weight / height ^ 2
                  skinny = 18.5
                  normal = 25.0
                  fat = 30.0 * x
                        where 
                        x = 1 

cylinder r h =
    let sideArea = x * pi * r * h
                 where 
                    x = abs (-2)
        topArea = pi * r ^ x
                where 
                    x = 2
    in sideArea + 2 * topArea

calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]