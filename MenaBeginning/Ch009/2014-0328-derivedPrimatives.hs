module DerPrimch9 where
import Prelude hiding (getLine,putStr,putStrLn) 
import System.IO hiding   (getLine,putStr,putStrLn)
-- ---18:00 -- post C# -------------------------------
-- -- ----------------Drived-Primatives------------------
-- getLine :: IO String 
getLine = do x <- getChar 
             if x == '\n' then 
                  return [] 
                else 
                    do xs <- getLine 
                       return (x:xs) 
--   
putStr 		:: String -> IO ()
putStr [] 	= return () 
putStr (x:xs) 	= do 	putChar x 
			putChar x -- with just x it compiles but wont compile  

putStrLn 	:: String -> IO () 
putStrLn xs 	= do 	putStr xs 
			putChar '\n' 

-- Erik rewrites the above as:
-- foldr (+) (return ()) 
-- where
-- x(+)p = putChar x >>= \_ -> P 

strlen :: IO () 
strlen = do 	putStr "Enter a string: " 
		xs <- getLine 
		putStr "The string has  " 
		putStr (show (length xs)) 
		putStrLn " characters" 

-- great scripting with haskell because IO monad script together IO computations with normal pure fucntions. 
-- Because you can define your own cntrol structures.
--
-- type IO of Unit it is a pure value and only when executed then side effects happen. But inside the program there is no direct way to see the side-effects happen. Program construction is firewalled away form the running of it and it's resulting side-effects.  
--
