
{- 
Why Haskell 

1990 Haskell 1.0 
    A programming research version

1997 Haskell 98     
    the core of the language is consolidated 

Purely Function 
    functions are values 
    values are unchangeable 

Lazy 
    things don't get evaluated until needed.

Strict Static Typed 
    but feels dynamic 

So different it feels hard

C- Engineer
Java/C# - Biz C

Haskell - Math
    strong theoretical roots
        early in it's dev it couldn't even 
        print to the screen 
        rather than do the just make it work approach it like others 
            they came up with the monad.

Cutting edge
S.T.M.
Parallel
Cloud computing 

industrial strength 

10 to 50 times faster than python or ruby
about as fast as C# and Java without trying -- the programming language benchmark game

ghci

repl 

let 

haskell source file

loading files

add some numbers and ++ some strings 

functions 

Pure Functions 

recursions

pattern Matching 

lazyness 

-- comments 

Purity 

Pure-fuctions can't change touch or change state.

Pure-fuctions can't change depend on or be changed by state that can be modified. 

If you can tell a function ran without using a debugger it's isn't pure. 
		printing to a file or screen
		reading from a file or screen 
		getting the current time 
		random number generation  
			they all depend on state. 
note that using head and tail 
where we might encounter the empty 
list makes for crashy programs
use patterns instead. 

In patterns it's always a good idea to include the otherwise even if just to give a final error option. 

Case expressions have no guards

where works with a function definition
	top down 
let allows assignments outside function definition 
  	bottom up 

always use spaces over tabs 

expressions over multiple lines must have indents 

watch let and where indents 






-}

