--------------- letLinesiNiceNice -----------------------
  
main :: IO () 
main = do 
    line1 <- getLine 
    line2 <- getLine 
    let lines = line1 ++ " " ++ line2 
    putStrLn lines  

