module Ch09 where 
-- So far we have been in the batch world of programming 
--		 _______________________
--		|			|
-- src - io --> |  Batch      process	| ------> result 
-- 		|_______________________|

-- 			
--
--		 _______________________
--		|			|
-- src - io --> |  Batch      process	| ------> result 
-- 		|_______________________|

	
-- so far we have expected that same values fed to same functions should give same result

-- we distinguish actions -- which have side effects -- from functions that don't.  
-- we can use types to distinguish the two 
-- because one has an action associated and the other doesn't 
--
-- IO () -- returns the identity element which can be used to tag actions for entry into our pure functional universe. 
--
-- type IO = World -> World 
type IO a = World -> (a , World)

-- expressions of type IO are called actions 
--
-- IO () are just side effecting, because they don't return a result.  
-- The empty tuple is an empty tuple. 
--
-- Basic actions in Haskell 
-- 	getChar :: IO Char 
-- 	putChar :: Char -> IO ()
-- 	return 	:: a -> IO a 
-- 	return v = \world -> (v, world)
--
-- 	return offers a BRIDGE between non-side-effecting functions and the impure universe side-effecting actions  
-- 	this is a small subset of functions, as most functions in Haskell effect nothing.
-- 	Impurity is a contamination because once side-effects are introduced there can beno going back.
