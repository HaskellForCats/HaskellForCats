module OptimumPath where 

-- 6 x 6 grid 
{- 
start =  (3,1,"start")
end = (2,4,"end")
x 	= (1,3,"xx")
x1  = (2,2,"xx")
x2 = (3,2"xx")
x3 = (2,3,"xx") 
x4 = (2,4,"xx")
-}
-----------------
-- a set would garenty uniqueness in a collection


xAxis6 =  repeat 6
xAxis5 = repeat 5 
xAxis4 = repeat 4
xAxis3 = repeat 3
xAxis2 = repeat 2 
xAxis1 = repeat 1   

yAxis1 = ['a'..'f'] 

xAndy1 = (zip xAxis6 yAxis1) :[]

-- start = 
