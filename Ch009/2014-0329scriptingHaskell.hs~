module Guess where 
guess     :: String -> IO ()
guess word =
   do putStr "> "
      xs <- getLine
      if xs == word then
         putStrLn "You got it!"
       else
         do putStrLn (diff word xs)
            guess word

diff      :: String -> String -> String
diff xs ys =
   [if elem x ys then x else '-' | x <- xs]	 


----- interactive Dialogue Function -------
-- does that mean I can have an IO monad in a list of functions like it was anyother function. 
-- [head as, tail as, IO as ()]

guess word =
   do  putStr "> " -- 
        xs <- getLine -- read from console 
-- in one case there is termination 
-- in another case there is recursion 
-- and now we can start abracting 
--
        if (p(xs) 
            terminate xs 
        else
         do success xs   
            guess word

----------------------------------------
-- abstracting further 
-- ---------------------------
guess word =
   do  putStr msg
        xs <- getLine
--
        if (p(xs) 
            terminate xs 
        else
         do success xs   
            guess (next state) 


----------------------------------------
-- ABSTRACTING FURTHER STILL 
-- ---------------------------
guess word =
   do  prelude -- abstract this  
        xs <- getLine
        if (p(xs) -- abstract over p 
            terminate xs -- abstract terminate  
        else
         do success xs  -- abstract success
            guess (next state) -- abstract next 

-- now we can have a function that takes five parameters 
--
guess pr p t s n w 
                        -- w stands for word as state 
   do  pr              -- reduce to pr           
        xs <- getLine
        if (p(xs) -- abstract over p 
            t xs -- abstract terminate  
        else
         do s xs  -- abstract success
            guess (n state) -- abstract next 


-- this is now a higher order function 
-- 
guess pr p t s n w 
                        -- w stands for word as state 
   do  pr              -- reduce to pr           
        xs <- getLine
        if (p(xs) -- abstract over p 
            t xs -- abstract terminate  
        else
         do s xs  -- abstract success
            guess pr p t s n (n w) -- recursive   

-- Expression composed of several sub Expressions 
-- E [E1, E2] -- E1 E2 are all that varies 
-- f = \xy E[x,y] -- function gets applied to original arguement 
--
-- 39:30 
