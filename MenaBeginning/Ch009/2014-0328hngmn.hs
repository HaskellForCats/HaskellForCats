module Main where 

-- a need primative pulled from C  
-- FFI is how we connect with other languages 

import System.IO 
getCh :: IO Char
getCh  = do {hSetEcho stdin False
	    ;  c <- getChar
	    ;  hSetEcho stdin True
	    ;  return c
            }

hangman :: IO () 
hangman = 
	do 	putStrLn "Think of a word:  " 
		word <- sgetLine
		putStrLn "Try to guess it:" 
		guess word 


sgetLine :: IO String
sgetLine  = do x <- getChar
               if x == '\n' then
                  do putChar x
                     return []
                else
                  do putChar '-'
                     xs <- sgetLine
                     return (x:xs)

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
