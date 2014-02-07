-- to run our new friend 
-- save it as a .hs file 
-- in terminal cd into the same dir 

main = putStrLn "Hello World" 
{- remember that Haskell is pure so it isn't running a function to print to the screen like we would if we were in a regular programming language. 
Haskell functions cannot directly touch anything in the outside world. 
Nor can Haskell functions depend on anything in the outside world. 
in ML or F# you have more flexibility in this regard but not in Haskell. 
Instead we have 
----------------------
-- IO ACTIONS -- 
---------------------
to run our new friend 
save it as a .hs file 
in terminal cd into the same dir 
type "ghc HI.hs"  
run it " ./HI " 

ML or F# you have more flexibility in this regard but not in Haskell. 
if we look at the types 
and info in the console 
---------------------------
Prelude Main> :t putStrLn 
putStrLn :: String -> IO ()
Prelude Main> :i putStrLn 
putStrLn :: String -> IO ()     -- Defined in `System.IO'
---------------------------

putStrLn :: String -> IO ()
putStrLn takes a string and returns a IO()
main = putStrLn "Hello World" 
