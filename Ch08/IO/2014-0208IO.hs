module IoFeb08 where 
{- 
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
---------- In this Program -----------


main = putStrLn "Hi there!"  -- you will see this line 

main2 = putStrLn "Hi there Again" -- you wont see this one. 

------------ WE COMPILE IT AND RUN IT --------------
➜  IO git:(master) ✗ ghc main2.hs 
[1 of 1] Compiling Main             ( main2.hs, main2.o )
Linking main2 ...
➜  IO git:(master) ✗ ./main2
Hi there!


---------- IN THIS NEXT PROGRAM -----------
main :: IO ()
main = do
        putStrLn "Welcome"
        putStrLn "to Haskell IO"
x = 3 -- is outside the do block and gets ignored.  


➜  IO git:(master) ✗ ghc doBlock.hs    
[1 of 1] Compiling Main             ( doBlock.hs, doBlock.o )
Linking doBlock ...
➜  IO git:(master) ✗ ./doBlock 
Welcome
to Haskell IO
---------------------------------------------
	 

---------- IN THIS THIRD PROGRAM -----------
helloWorld :: IO () 
helloWorld = putStrLn "Hello World" 

main :: IO () 
main = do 
	helloWorld 
	helloWorld 
	helloWorld 
------------ WE COMPILE "doBlock2"  AND RUN IT --------------
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

 
---------- IN THIS FOURTH PROGRAM -----------
