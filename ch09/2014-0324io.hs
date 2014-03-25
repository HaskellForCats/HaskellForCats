module Ch9io where

 
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

getChar >>= \x -> 
getChar >>= \_ -> 
getChar >>= \y -> 
     return (x,y) 

-- getChar >>= \x -> \_ -> \y -> return (x,y)
