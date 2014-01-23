module Main where 
-- :   set expandtab ts=4 ruler number spell 
-- stdout and stdin, meaning standard output and standard input. Writing to and reading from files is very much like writing to the standard output and reading from the standard input.
import System.IO
main = do
    contents <- readFile "2_B_R_0_2_B.txt"
    putStr contents
