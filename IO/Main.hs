module Main where

main    =  do
        input <-readFile "input.txt"
	print $ countWords input 
	
countWords input = map (length.words) (lines input) 	  
