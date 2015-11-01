
module FourStepsToMonad where 
-- composition controls side effects 
import Control.Applicative 
import Data.Monoid 
import Data.Foldable 
import Data.Traversable
import Data.Bifunctor 
import Control.Monad.State
import Control.Monad.Trans.State 
import Control.Monad.Trans.Class

-- monads a region of action 
-- 
-- higher kinded types 
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


-- can't arbitrarily nest with Ma 
-- data Dada = Dada deriving (Show) 
data M a  = M a

f :: a -> IO a 
f a = return a 

g :: a -> IO a
g a = do
    putStrLn "Got here!"
    return a

 
dada01 = \a -> (f a) 

dada02 = \a -> (g a) 

dada03 a = a >>= id

-- dada03 = dada02 >>= dada01

dada04 = (return (\a -> (g a))) >>= (\a -> (f a)) 

{-      
fn001 = \a -> \b -> (a,b)
fn011 a = fn001 . f 
fn022 a =  ((hC.gC).fC)(a) -- >>= hC(gC(fC(a)))
fn033 a = hC(gC(fC(a)))
fn044 a = (hC.(gC.fC))(a)
-}


-- [ (+1), (+2), (+3) ] <*> [ 4, 5, 6 ]
-- [ (*2), (*3) ] <*> [ 1, 2, 3, 4 ]
-- (pure 1) :: [Int] 
-- (return 1) :: [Int] 
-- fmap show  [-1,-2 ] 

type State s a = s -> (s,a) 

type StateT s m a = s -> m (a,s)

