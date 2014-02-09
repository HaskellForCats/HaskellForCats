main :: IO () 
main = do 
    line1 <- getLine 
    line2 <- getLine 
    putStrLn (line1 ++ " " ++ line2) 

