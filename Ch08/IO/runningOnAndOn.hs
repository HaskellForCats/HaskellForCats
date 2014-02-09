-----------------runningOnAndOn--------------------------
main :: IO () 
main = do 
    return 0 
    putStrLn "haha, still running" 
    return "halt!" 
    putStrLn "you can't stop me!" 


