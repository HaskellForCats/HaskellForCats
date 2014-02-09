promptInfo :: IO (String,String) 
promptInfo = do 
    putStrLn "What is your name?" 
    name <- getLine 
    putStrLn "What is your favorite color" 
    color <- getLine 
    return (name, color)

main :: IO () 
main = do 
    (name, color) <- promptInfo 
    putStrLn ("Hello " ++ name) 
    putStrLn ("I like " ++ color ++ " too!")  
