module StockBuy where

dollarBuyTime = [("0001",200.00),("0060",500.00),("0120",400.00),("0180",150.00),("0220",300.00)]
dollars =  map snd dollarBuyTime  -- [200.0,500.0,400.0,150.0,300.0]
buyTime =  map fst dollarBuyTime  -- ["0001","0060","0120","0180","0220"]
maxVal =  maximum $ dollars   --  500.0
minVal = minimum  $ dollars  -- 150.0 
orderDollars = zip [0..] dollars  -- [(0,200.0),(1,500.0),(2,400.0),(3,150.0),(4,300.0)]
orderTimes = zip [0..] buyTime  -- [(0,"0001"),(1,"0060"),(2,"0120"),(3,"0180"),(4,"0220")]
-- filter :: (a -> Bool) -> [a] -> [a]
-- flip :: (a -> b -> c) -> b -> a -> c 
split1 = splitAt 2 dollars 
h1 = snd $ head dollarBuyTime 	
h2 = snd $ head $ tail dollarBuyTime 
h3 = snd $ head $ tail $ tail dollarBuyTime	
h4 = snd $ head $ tail $ tail $ tail dollarBuyTime
h5 = snd $ head $ tail $ tail $ tail $ tail dollarBuyTime


diff012 = abs (h1 - h2)  
diff023 = abs $ h2 - h3
diff034 = abs $ h3 - h4
diff045 = abs $ h4 - h5
ajmaxdif = maximum [diff012,diff023,diff034,diff045] 