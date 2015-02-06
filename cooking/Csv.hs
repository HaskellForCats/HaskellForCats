module Csv where 
import Text.CSV 


-- Parses a CSV file
main :: IO ()
main = do
  let fileName = "input.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  either handleError doWork csv
  
handleError csv = putStrLn "not a CSV"
doWork csv = (print.findYoungest.tail) (filter (\x -> length x == 2) csv)

-- Finds oldest person.
findYoungest :: [Record] -> Record
findYoungest [] = []
findYoungest items = foldl1 (\a x -> if age x < age a then x else a) items

age [a,b] = toInt b

toInt :: String -> Int                               
toInt = read