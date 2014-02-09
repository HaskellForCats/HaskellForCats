module IoFeb08 where 
-- Compiling 
-- IO Actions 
-- IO Values 
-- return 
-- do-Blocks 
-- Useful IO Actions 
-- IO dos and Dont's


{- 55 days  
: set lineBreak 
: set spell 
: set noSpell
: syntax enable 

because Haskell functions are Pure 
	they cannot modify external state 
	nor can they depend on external values 
	they can't even write to the console directly 

main = putStrLn "Hi" 
iin> :t ()
() :: ()f we look at the types for our HI.hs 
Main> :t main 
Main> :t ()
() :: ()
data Unit = Unit 
 has type IO 
() has type () -- this is similar to most languages that have  the concept of void. 
it's kind of a place holder where there are no values. 
data IO a -- is a parameterized type that can hold any value. 
putStrLn :: String -> IO () -- has type IO () which means it returns an IO Unit 
	-- an IO Unit is an IO Action.
	-- it represents some code that could be run and interact with the outside world. 
	-- this code could be run but doesn't get run without an IO Action. Thus you could call this
Main is significant because IO doesn't happen without it. 
	the runtime environment looks for main and if has an IO Action associated with it, that IO Action gets executed and side-effects are performed. 
-}

---------- In this Program -----------

main = putStrLn "Hi there!"  -- you will see this line 

main2 = putStrLn "Hi there Again" -- you wont see this one. 

{----------- WE COMPILE IT AND RUN IT --------------
➜  IO git:(master) ✗ ghc main2.hs 
[1 of 1] Compiling Main             ( main2.hs, main2.o )
Linking main2 ...
➜  IO git:(master) ✗ ./main2
Hi there!


-}-------- IN THIS NEXT PROGRAM -----------
main :: IO ()
main = do
        putStrLn "Welcome"
        putStrLn "to Haskell IO"
x = 3 -- is outside the do block and gets ignored.  


{----------- WE COMPILE IT AND RUN IT --------------
➜  IO git:(master) ✗ ghc doBlock.hs    
[1 of 1] Compiling Main             ( doBlock.hs, doBlock.o )
Linking doBlock ...
➜  IO git:(master) ✗ ./doBlock 
Welcome
to Haskell IO
---------------------------------------------
	 

-}-------- IN THIS THIRD PROGRAM -----------
helloWorld :: IO () 
helloWorld = putStrLn "Hello World" 

main :: IO () 
main = do 
	helloWorld 
	helloWorld 
	helloWorld 
{----------- WE COMPILE "doBlock2"  AND RUN IT --------------
➜  IO git:(master) ✗ ghc doBlock2.hs 
[1 of 1] Compiling Main             ( doBlock2.hs, doBlock2.o )
Linking doBlock2 ...
➜  IO git:(master) ✗ ./doBlock2     
Hello World
Hello World
Hello World
---------------------------------------------
it is worth noting that putStrLn doesn't get run directly; it only sees Action in the main-DO-Block
In other programming languages putStrLn would print immediately and not have to wait until it saw DO-Block Action

 
-}-------- IN THIS FOURTH PROGRAM ----------- 
introduce :: String -> String -> IO 
imtroduce name1 name2 = do -- this one do block  
	putStrLn (name1 ++ ", this is " ++ name2) 
	putStrLn (name2 ++ ", this is " ++ name1) 
main :: IO ()
main =  do -- this is the second do block composed with the first 
	introduce "Alice" "Bob" 
	introduce "Alice" "Sally" 

-{---------- WE COMPILE "intro"  AND RUN IT --------------
C:\Users\evxasus001\Documents\GitHub\_HaskellForCats\Ch08\IO [master +3 ~1 -0 !]> ghc .\intro.hs
[1 of 1] Compiling Main             ( intro.hs, intro.o )
Linking intro.exe ...
C:\Users\evxasus001\Documents\GitHub\_HaskellForCats\Ch08\IO [master +6 ~1 -0 !]> .\intro.exe
Alice, this is Bob
Bob, this is Alice
Alice, this is Sally
Sally, this is Alice

NOTE!! because we are running this on a PC we have a .exe file to run. 

-}--------- IO VALUES ------------------------
main :: IO () 
main = do 
	line <- getLine 
	putStrLn ("You said: " ++ line)


-{---------- WE COMPILE "ioValues"  AND RUN IT --------------
C:\Users\evxasus001\Documents\GitHub\_HaskellForCats\Ch08\IO [master +8 ~1 -0 !]> ghc .\ioValues.hs
[1 of 1] Compiling Main             ( ioValues.hs, ioValues.o )
Linking ioValues.exe ...
C:\Users\evxasus001\Documents\GitHub\_HaskellForCats\Ch08\IO [master +11 ~1 -0 !]> .\ioValues.exe
Hello Haskell
You said: Hello Haskell 


-- checking the types in prelude 
Prelude> :i getLine
getLine :: IO String    -- Defined in `System.IO'

getLine has type IO String 
remembering that IO is a parameterized datatype, in main :: IO () -- unit a.k.a. () is the parameter  
-- IO () means nothing is added here; () is just place holding until an action occurs.
-- getLine uses String as it's parameter  
-- getLine can go and interact with the world-outside and when it comes back it returns a string. 
-- getLine reads from the console buffer and returns the result as a string and after it's done clears the buffer. 
-- after it has read that one line it's done 
-- the IO string gets morphed into a String that fits our internal type class restrictions for Strings.
-- Prelude> :i String
-- type String = [Char]    -- Defined in `GHC.Base'
-- <- getLine  the getLine is the IO action, "line" a variable that takes the value of IO Action the getLine is the IO action, "line" a variable that takes the value of IO Action. 
-- we are doing a binding action here and this can only occur inside a DO BLock. This binding can only be used after it has been bound in the same do block. 
-- you can only extract the value from an IO Action inside an IO Action. 
-- do-blocks only create IO actions that can be executed later. 
-- Line gets only the value produced by getLine  
-}--------------------------------------------------------
greet :: IO () 
greet = do 
	putStrLn "Who are you?" 
	who <- getLine 
	putStrLn ("Hello " ++ who) 

greetForever :: IO () 
greetForever = do 
	greet     
	greetForever 

main :: IO () 
main = greetForever 

-- IO action calling itself recursively 
	     
---------- RETURN FUNCTION ----------------------- 
dummyGetLine :: IO String 
dummyGetLine = 
	return "I'm not doing anything" 

main :: IO () 
main = do 
	line <- dummyGetLine 
	putStrLn line 

{------------- WHEN WE COMPILE AND RUN THIS ------ 
no matter what the return will give us the same answer everytime. 

➜  IO git:(master) ghc dummyGetLine.hs 
[1 of 1] Compiling Main             ( dummyGetLine.hs, dummyGetLine.o )
Linking dummyGetLine ...
➜  IO git:(master) ✗ ./dummyGetLine 
I'm not doing anything
-----------------------------------
Prelude Main> :i return 
class Monad m where
  ...
  return :: a -> m a
  ...
  	-- Defined in `GHC.Base'
Prelude Main> :t return 
return :: Monad m => a -> m a

return isn't doing much other than returning "I'm not doing anything"

it will just return whatever "a" is. 
-}------------------------------------------
promptInfo :: IO (String,String) 
promptInfo = do 
    putStrLn "What is your name?" 
    name <- getLine 
    putStrLn "What is your favorite color" 
    color <- getLine 
    return (name, color)

main :: IO () 
main = do 
    (name, color) <- promptInfo 
    putStrLn ("Hello " ++ name) 
    putStrLn ("I like " ++ color ++ " too!")
{------------------------------------------------------
➜  IO git:(master) ✗ ghc promptInfo.hs
[1 of 1] Compiling Main             ( promptInfo.hs, promptInfo.o )
Linking promptInfo ...
➜  IO git:(master) ✗ ./promptInfo   
What is your name?
EV
What is your favorite color
RED
Hello EV
I like RED too!
----------------------------------------------------
return (name, color) will always return (name, color). 


-}------------- getLineTwice ----------------
main :: IO () 
main = do 
    line1 <- getLine 
    line2 <- getLine 
    putStrLn (line1 ++ " " ++ line2) 
{---------------------------------------------------
➜  IO git:(master) ✗ ghc returnLines2.hs
[1 of 1] Compiling Main             ( returnLines2.hs, returnLines2.o )
Linking returnLines2 ...
➜  IO git:(master) ✗ ./returnLines2     
Okay 
Now What 
Okay  Now What 
-}---------------------------------------------------
---------------- reTurnRightAroundIo ----------------
-- works but is stylistically poor!

main :: IO () 
main = do 
    line1 <- getLine 
    line2 <- getLine 
    lines <- return (line1 ++ " " ++ line2) 
    putStrLn lines  

--------------- letLinesiNiceNice -----------------------
  
main :: IO () 
main = do 
    line1 <- getLine 
    line2 <- getLine 
    let lines = line1 ++ " " ++ line2 
    putStrLn lines  

-----------------runningOnAndOn--------------------------
main :: IO () 
main = do 
    return 0 
    putStrLn "haha, still running" 
    return "halt!" 
    putStrLn "you can't stop me!" 

{------------------------------------------------------
in other languages it would be expected that the first return would mask the second
but not here. 
➜  IO git:(master) ./runningOnAndOn                          
haha, still running
you can't stop me!

------------------------------------------------------}
putStrLn :: String -> IO () 
getLine :: IO String 

print :: (Show a) => a -> IO () 
-- prints string representation of a value; what's printed has to be in the Show type class. 

readFile :: FilePath -> IO String 
-- reads a file as a lazy string 
-- the whole file doens't have to fit in memory because recursive calls to it will garbage collect away whatever has already been read. 

writeFile :: FilePath -> String -> IO () 
-- writes strings to a file. 
appendFile :: FilePath -> String -> IO () 
-- Appends to the end of a file 
-- Prelude> :i FilePath 
-- type FilePath = String 	-- Defined in `GHC.IO' 
interact :: (String -> String) -> IO () 
-- input of program goes to first String; the output goes to the second String. 

------------------ interactWithMe ---------
reverseLines :: String -> String 
reverseLines input = 
    unlines (map reverse (lines input))

main :: IO () 
main interact reverseLines 

------------------------------------------
-- USE AS LITTLE io AS POSSIBLE DON'T BE TEMPTED TO GO io CRAZY. 
------------------------------------------
encrypt :: Char -> Char 
    | 'A' <= c && c < 'Z' = toEnum (fromEnum 'A' + 3) 
    | c == 'Z' = 'A' 
    | otherwise = c 


main :: IO () 
main = interact (map encrypt) 

------------------------------------------
