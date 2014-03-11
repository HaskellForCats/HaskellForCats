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
