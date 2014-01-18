module Ch1002 where 

-- Functions taking Functions as args 
-- arg order makes a diff in function application 

plus1   = (+) 1 -- adds one to plus1's arg
plus1'  = (1+)  -- here + is param
plus1'' = (+1)  -- 1 is param
{-
*Ch1002>  plus1 4
5
*Ch1002> plus1' 4
5
*Ch1002> plus1'' 4
5
-}


(a,b) .+ (c,d) = (a + c, b +d)  -- note the new operator .+ 


-- *Ch1002> map length ["hi","what the...","no"]
-- [2,11,2]

-- *Ch1002> map (1+) [1,3,5,7] 
-- [2,4,6,8]
double = map (2*) 
-- *Ch1002> double [2..11]
-- [4,6,8,10,12,14,16,18,20,22]

-- filter uses a boolian to filter out a condition 


isEven x = x `mod` 2 == 0 
removeOdd = filter isEven 


-- foldl starts on the left and is tail recursively faster than foldr
-- foldr starts on the right slower but good for infinite lists

-- zip 
-- zipWith 
-- *Ch1002> zipWith (+) [1..5] [101..110] 
-- [102,104,106,108,110] 

-- lamda's are nice but only where you can't partially apply neatly or when a named function would seem be adding extra clutter. 

-- (.) function composition is applied right to left.
-- 	functions can only have one arg 

-- ($) Function applicator takes function and a value and applies function to the value.
-- 	most helpful when you want de-clutter parens 

-- compiler is smart about type annotations you usually don't have to declare but can to disambiguate and make it easier to read through the code. Or to keep you from deluding yourself or others about what the code does. Or you might have to optimize with and Int or two but don't until you have to. 
-- repeated type vars like when you see a->a->a means anytype but all the same of that type a->b->a means "b" is different in some respect than a, or indifferent to a.
  
-- type is like a class diagam in oop 

{- 
*Ch1002> let x = show (read "123") 
*Ch1002> x
"*** Exception: Prelude.read: no parse
*Ch1002> let x' = show (read "123" :: Int) -- note the need to define  
*Ch1002> x'
"123"
 -}

 	

