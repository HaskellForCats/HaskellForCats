module 

 Ch09 where 
-- So far we have been in the batch world of programming 
--               _______________________
--              |                       |
-- src - io --> |  Batch      process   | ------> result 
--              |_______________________|

--          
--
--               _______________________
--              |                       |
-- src - io --> |  Batch      process   | ------> result 
--              |_______________________|

    
-- so far we have expected that same values fed to same functions should give same result

-- what about 

-- ReadLine :: () -> String 
-- 
-- ReadLine () -- this instance is one line  
-- 
-- ReadLine () -- this instance is another line 

-- each line will have a different value because each instance is a seperate instance. 
-- ReadLine is not a mathmatical function, so we can't have the same assurances that we have when we are dealing with pure functions. 
-- this is where monads come in. 

-- ReadWristWatch :: IO DateTime 
-- WriteWristWatch :: DateTime -> IO () -- which doesn't return us anything but still has side-effects. 

-- IO Char -- type of actions that return a character 
-- IO () -- type of purely effecting actions that return no value. 
 
-- () these empty tuples have no components 

-- we distinguish actions -- which have side effects -- from functions that don't.  
-- we can use types to distinguish the two 
-- because one has an action associated and the other doesn't 
--
-- IO () -- returns the identity element which can be used to tag actions for entry into our pure functional universe. 


-- f :: Int -> () 
-- f x = ()  
-- f:: Int -> IO ()
-- f x = IO () 

--------------------------------------------
-- type IO = World -> World 
-- type IO a = World -> (a , World)

-- expressions of type IO are called actions 
--
-- IO () are just side effecting, because they don't return a result.  
-- The empty tuple is an empty tuple. 
-------------------------------------------
-- Basic actions in Haskell 
--  getChar :: IO Char 
--  putChar :: Char -> IO ()
--  return  :: a -> IO a 
--  return v = \world -> (v, world)
-------------------------------------------
-- do   { Char <- IO Char 
-- same as 
-- do   { x <- getChar 
--      ; getChar 
--      ; y <- getChar 
--      ; return (x,y) 
--      }



--  this is a small subset of functions, as most functions in Haskell effect nothing.
--  Impurity is a contamination because once side-effects are introduced there is no going back.

-- (>>=) :: IO a -> (a -> IO b) -> IO b 
-- f >>= 9 = \world -> case f world of 
--                       (v, world') -> g v world' 

box :: [String] 
box = [ "+---------------+",
        "|               |", 
        "+---+---+---+---+", 
        "| q | c | d | = |", 
        "+---+---+---+---+", 
        "| 1 | 2 | 3 | + |", 
        "+---+---+---+---+", 
        "| 4 | 5 | 6 | - |", 
        "+---+---+---+---+", 
        "| 7 | 8 | 9 | * |", 
        "+---+---+---+---+", 
        "| 0 | ( | ) | / |", 
        "+---+---+---+---+"]

buttons :: [Char] 
buttons = standard ++ extra 
            where 
                standard = "qcd=123+456-789*0()/"
                extra = "QCD \ESC\BS\DEL\n" 

-- showbox :: IO () 
-- showbox = seqn [writeat (1,y) xs | (y,xs) <- zip [1..13] box]

