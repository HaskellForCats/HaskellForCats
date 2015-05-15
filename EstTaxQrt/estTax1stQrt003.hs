module  EstTax1stQrt where
import Text.CSV 
import Data.Char
import Data.String
import Debug.Trace
-- csv >>= (\x -> case x of Left _ -> error "DIE!"; Right things -> return things)
-- csv >>= (\x -> case x of Left _ -> error "DIE!"; Right things -> return $ head things)
-- csv >>= (\x -> case x of Left _ -> error "DIE!"; Right (_:(_:z:_):_) -> return z)
--|> ["2015-01-01","$3.24","APL* ITUNES.COM/BILL   866-712-7753  CA","2"]
foo :: IO [Record]
foo = do 
   let fileName = "x20150108.csv" 
   monthExpense <- readFile fileName
   putStrLn (show monthExpense) 
   let ys = map (stripChars "$") . monthExpense
   let csv = parseCSV fileName monthExpense

   --case csv of
   --               Right (x:xs) -> return xs 
   --               Left _ -> error "Crash!" 
   return [] 

stripChars :: String -> String -> String
stripChars = filter . flip notElem

--data MonthExpense  = MonthExpense  
--                     { date     :: String
--                     , amount   :: String
--                     , detail   :: String
--                     , debit    :: String
--                     } 

-- map (\[a1,a2,a3,a4] -> )
-- map (\[x,y] -> JField {fname = x, ftype = y}) data
-- where data is your input. I think that would do it.


main :: IO ()
main = do 
   xs <- foo        
    

   --let as = [stripChars "$"  x|x <- head xs]          -- (x!!1))  
   -- let a = read as :: Float 
   -- print a  
   print xs -- !!1

-- handleError csv = putStrLn "not a CSV"

-- getDollars [] = [] 
-- getDollars items = 
---------------------------------------
-- import Data.String
-- import Data.Csv

-- data MonthExpense  = MonthExpense  
--                      { date     :: String
--                      , amount   :: String
--                      , detail   :: String
--                      , debit    :: String
--                      } 

-- (<*>) :: f (a -> b) -> f a -> f b 
        -- Sequential application.
-- (<$>) :: Functor f => (a -> b) -> f a -> f b 
        -- An infix synonym for fmap.


{- 
doWork csv = (print.findOldest.tail) (filter (\x -> length x == 2) csv)

-- Finds oldest person.
findOldest :: [Record] -> Record
findOldest [] = []
findOldest items = foldl1 (\a x -> if age x > age a then x else a) items

age [a,b] = toInt b

toInt :: String -> Int                               
toInt = read

--------------------------------------------
-- constants for EstTax
--------------------------------------------
nycOglig        = 0.03534
albanyOblig     = 0.059
fedObligat      = 0.3 

-- imported expenses into a list 
expen = [dec02,dec26,nov09,oct07,sept07]

-- totaling the list
sumExpen = sum expen 
---------------------------------------------
-- totaling earned and subtracting expenses
earned4Qt = (sum [earnedSep,earnedOct,earnedNov,earnedDec,prevQt]) - sumExpen
                where  
                earnedSep = 0 
                earnedOct = 9000
                earnedNov = 0 
                earnedDec = 0 
                prevQt= (0 + prev)
                        where  
                        prev = 0  -- anything not otherwise included above

---------------------------------
-- formulary for arriving at the Fed, State, and local plus the total quaterly
taxFed = earned4Qt * fedObligat
taxAlbany = ( earned4Qt*albanyOblig)
taxNYC = ( earned4Qt*nycOglig)
taxTotalObligado = sum[taxFed, taxAlbany, taxNYC] 
---------------------------------
-}
------- result -----------------
{- 
*EstTax4Qrt> taxFed
2028.474
*EstTax4Qrt> taxAlbany
398.93321999999995
*EstTax4Qrt> taxNYC
238.95423720000002
*EstTax4Qrt> taxTotalObligado
2666.3614572
-}


