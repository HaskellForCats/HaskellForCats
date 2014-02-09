encrypt :: Char -> Char 
    | 'A' <= c && c < 'Z' = toEnum (fromEnum 'A' + 3) 
    | c == 'Z' = 'A' 
    | otherwise = c 

main :: IO () 
main = interact (map encrypt) 
