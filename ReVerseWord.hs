module ReVerseWord where 
import Data.Char
main = do 
	line <- getFile 
	if null line 
		then return () 
		else do 
				putStrLn $ reverseWords line 
				main 
reverseWords :: String -> String 
reverseWords = unwords . map reverse . words 