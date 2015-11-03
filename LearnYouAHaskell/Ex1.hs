module Ex1 where 

lastItem :: Num a => [a] -> a 
lastItem xs = xs!!((length xs)-1)  

nextTolastItem :: Num a => [a] -> a 
nextTolastItem [] = 0
nextTolastItem xs = xs!!((length xs)-2)  


-- elementAt xs x = xs!!((length xs)-(x-1)) 

elementAt :: [a] -> Int -> [a] 
elementAt xs 0 = []
elementAt xs x = xs!!(((length xs)-((length (tail xs))))+(x-2)):[]

myLength :: [a] -> Int 
myLength [] = 0
-- myLength [xs] = length [xs]
myLength xs = (foldl (\c _ -> c+1) 0) xs 

foldl'' f z0 xs = foldr f' id xs z0
                where f' x k z = k $! f z x

data MyMaybe a = Just a | Nothing 

myMaybe a = Just a   |Nothing 