module Ch9io where
import Prelude hiding (getLine,putStr,putStrLn) 
import System.IO hiding   (getLine,putStr,putStrLn)
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b 
-- can be seen this way 
-- (>>=) :: IO a -> (a -> IO b) -> IO b 

-- monads as containers? 

-------------------------------------------
-- do   { Char <- IO Char 
-- same as 
-- do   { x <- getChar 
--      ; getChar 
--      ; y <- getChar 
--      ; return (x,y) 
--      }

-- this can be seen as 
-- 
-- getChar >>= \x -> 
-- getChar >>= \_ -> 
-- getChar >>= \y -> 
--      return (x,y) 

-- getChar >>= \x -> \_ -> \y -> return (x,y)
--
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

 
