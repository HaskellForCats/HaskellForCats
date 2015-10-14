module FourStepsToMonad where 
{- 
id' a = a
f a = abs a 
f1 a = a + a 
fC = f.f1
g a = abs a 
g1 a = a * a 
gC = g.g1 
hC  = gC.fC  
hC1 = fC.gC
hC2 = hC.gC.fC
hC3 = hC.fC.gC
iC0 = hC2.hC2.hC2.hC2 
-}
-- hC2 (-11111111111111111111111111111)
-- iC0 (-11111111111111111111111111111111)
-- (0.02 secs, 3143504 bytes)




