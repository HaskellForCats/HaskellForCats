module FourStepsToMonad where 
-- composition controls side effects 
 
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

-- hC2 (-11111111111111111111111111111)
-- iC0 (-11111111111111111111111111111111)
-- (0.02 secs, 3143504 bytes)


-- can't arbitrarily nest with Ma 
-- data Dada = Dada deriving (Show) 
dada01 a = \a -> (f a) 
dada02 a = \a -> (g a) 
dada03 = dada02 >>= dada01
		
fn001 = \a -> \b -> (a,b)
fn011 a = fn001 . f 
fn022 a =  ((hC.gC).fC)(a) -- >>= hC(gC(fC(a)))
fn033 a = hC(gC(fC(a)))
fn044 a = (hC.(gC.fC))(a)


