module Guess where

-- the following program reads to the screen; prints a line; does something again; and then recurses.  
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
   do  putStr "> " -- print something to srceen 
        xs <- getLine -- get something from a user; 
-- then the Program does one of two things; 
-- in one case there is termination. 
-- In another case there is recursion.  
--
        if (p(xs) terminate xs 
        else
         do success xs    
            guess word -- recursion 

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

-- five things to abstract over: prelude--(pr), p, terminate, success, next

-- now we can have a function that takes five parameters 


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

-- an interactive expression 
-- Expression composed of several sub Expressions 
E [E1, E2] -- E1 E2 are all that varies 
f = \xy E[x,y] -- function gets applied to original arguement 
-- Laziness makes this possible 
-- Value of type unit IO is unrun until a side-effect is required 
-- They can be composed with pure functions 
-- this glues together imperative 
-- this gives us a higher order functional glue that can encapulate imperative computations inide the IO Monad.    
