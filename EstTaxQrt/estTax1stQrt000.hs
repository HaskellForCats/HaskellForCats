module  EstTax1stQrt where
-- if we run:  
-- runhaskell -hide-package --ghc-arg=bytestring-0.10.4.1 estTax1stQrt000.hs
{- //> parse error (Failed reading: conversion error: expected Char, got "2015-01-01") at
"2015-01-02","$5.10","DUANE READE #14356     NEW YORK      NY","2"
"2015-01-02","$13.58","BATTERY P (truncated) -} 

import Text.CSV 
import Data.String
import Data.Csv
import qualified Data.Vector as V
import qualified Data.ByteString.Lazy as BL

main :: IO ()
main = do 
    csvData <- BL.readFile "20150108.csv"
    case decode NoHeader csvData of
        Left err -> putStrLn err
        Right v -> V.forM_ v $ \ xs  ->
            putStrLn  xs 

