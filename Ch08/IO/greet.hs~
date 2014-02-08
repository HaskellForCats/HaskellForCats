----------------------------------------------------------
greet :: IO ()
greet = do
        putStrLn "Who are you?"
        who <- getLine
        putStrLn ("Hello " ++ who)

greetForever :: IO ()
greetForever = do
        greet
        greetForever

main :: IO ()
main = greetForever

