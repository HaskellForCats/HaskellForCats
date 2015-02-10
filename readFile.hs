module ReadFile where 


main = do 
	input <- readFile "input.txt" 

	countWords input = map 
	(lenght.words) (lines input) 

