---------- RETURN FUNCTION ----------------------- 
dummyGetLine :: IO String 
dummyGetLine = 
        return "I'm not doing anything" 

main :: IO () 
main = do 
        line <- dummyGetLine 
        putStrLn line 



