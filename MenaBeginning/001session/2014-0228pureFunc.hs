module PureFunc where 

-- Haskell functions are pure 
-- They don't touch the outside world
-- They don't take in stuff from the outside world. 
-- The outside world is full of danger. 
-- This is the the only well known language that does this.
-- All other programming languages let the world in with way less control.
-- our functions will never directly modify state. 
-- State is the outside world, is also represented by time. 
-- In other programming, time is important because the program parts are changing constantly. 
-- Haskell is pure. No State, and time has almost no impact. 
-- Forward or backwards it behaves the same. 
-- This is not true elsewhere. Time matters, state has always got to be accounted for. 
-- when we assign x = 2 and y = 2  it is immutable. 
-- x and y will not be changed unless we change it, and even when we do change them, the first values of x and y are retained but just derefernced. 
-- they are NOT written over, ever. 
-- dereferencing and writing over are very different. 
-- writing over stuff is the way it's always been done. 
-- But writing over stuff is dangerous and causes programs to crash, especially when other parts of the program try to read the written over values. CRASH!
-- very important big programs have all kinds of ways to try and manage this problem but as programs get more complicated they are fighting a losing battle. 
 
-- Haskell avoids this altogether. 
-- Haskell programs are more stable as a result. 
-- 15 years ago, even 10 years ago, it wasn't practical to make things immutable but since 2005 everything changed. 
-- In Haskell the same arguements given to the same function should give the same result ALWAYS!
-- this is not a reasonable expectation elsewhere in world of programming. 
-- You will hear about test driven development. 
-- That is how other programmers try and prevent these and other problems that Haskell doesn't have. 

-- things like printing to the screen 
-- are not trivial in Haskell because they involve external state.
-- niether is reading from a file, or getting the current time. 
-- the outside world is dangerous, so when we go there we must take some special precautions. The goal is to keep our functions safe from outside world weirdness, and still get real work done. 


-- multicores 
 
