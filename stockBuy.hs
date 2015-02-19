module StockBuy where

dollarBuyTime = [("0001",200.00),("0060",500.00),("0120",400.00),("0180",150.00),("0220",300.00)]
dollars =  map snd dollarBuyTime  -- [200.0,500.0,400.0,150.0,300.0]
buyTime =  map fst dollarBuyTime  -- ["0001","0060","0120","0180","0220"]
maxVal =  maximum $ dollars   --  500.0
minVal = minimum  $ dollars  -- 150.0 
orderDollars = zip [0..] dollars  -- splitAt :: Int -> [a] -> ([a], [a])
orderTimes = zip [0..] buyTime  -- [(0,"0001"),(1,"0060"),(2,"0120"),(3,"0180"),(4,"0220")]
-- filter :: (a -> Bool) -> [a] -> [a]
-- flip :: (a -> b -> c) -> b -> a -> c 
-- splitAt :: Int -> [a] -> ([a], [a]) 