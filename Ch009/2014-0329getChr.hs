
import System.IO
{-
getCh                         :: IO Char
getCh                         =  do hSetEcho stdin False
                                    c <- getChar
                                    hSetEcho stdin True
                                    return c
-}
a :: IO (Char, Char)
a = do x<- getChar
       putChar x
       getChar
       y<- getChar
       putChar y
       return (x,y)
{-
getLine :: IO String
getLine  = do x <- getChar
              if x == '\n' then
                 return []
               else
                 do xs <- Main.getLine
                    return (x:xs)

putStr       :: String -> IO ()
putStr []     = return ()
putStr (x:xs) = do putChar x
                   putStr xs
-}

echo :: IO ()
echo = do x<-getLine
          putStr x

strlen :: IO ()
strlen  = do putStr "Enter a string: "
             xs <- getLine
             putStr "The string has "
             putStr (show (length xs))
             putStrLn " characters"

hangman :: IO ()
hangman  =
   do putStrLn "Think of a word: "
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
