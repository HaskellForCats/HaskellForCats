import Control.Monad 
import System.IO 
--  the empty tuple, () 
--  also know as unit, is an IO Action which includes a return value inside it, 
--  if no actual return value then the empty () is returned. 
--  The empty tuple is a value of () and it also has a type of ().
--  An I/O action will be performed when we give it a name of main and then run our program.
--  the do syntax to glues together several I/O actions into one.
{-
main = do  
    putStrLn "Hello, what's your name?"  
    name <- getLine  
    putStrLn ("Hi " ++ name ++ ", welcome to Haskell")
-}
-- By convention, we don't usually specify a type declaration for main. 
-- main :: IO () 
-- getLine :: IO String 
-- name <- getLine  
-- means perform the I/O action getLine  
-- then bind its result value to name. 
-- getLine has a type of IO String, so name will have a type of String. 
-- the only way to access data inside the bind is to use the <- construct. 
--

main = do   
    contents <- readFile "2_B_R_0_2_B.txt"   
    if null contents  
        then return ()  
        else do  
            putStrLn $ reverseWords contents
            main  
  
reverseWords :: String -> String  
reverseWords = unwords . map reverse . words 


