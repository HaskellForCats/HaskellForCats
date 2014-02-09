---------------- reTurnRightAroundIo ----------------
-- works but is stylistically poor!

main :: IO () 
main = do 
    line1 <- getLine 
    line2 <- getLine 
    lines <- return (line1 ++ " " ++ line2) 
    putStrLn lines  

