module ContrMo where 

import Control.Monad as C 

-- forM :: Monad m => [a] -> (a -> m b) -> m [b]

-- forM_ :: Monad m => [a] -> (a -> m b) -> m () 

{- 
*ContrMo> forM [1,2,3] print
1
2
3
[(),(),()]
*ContrMo> forM_ [1,2,3] print
1
2
3
-}
-- replicateM :: Monad m => Int -> m a -> m [a]
{-
*ContrMo> replicateM 3 (putStrLn "hello")
hello
hello
hello
[(),(),()]
-}

-- A do if true or a don't do if false
-- when :: Monad m => Bool -> m () -> m ()

{- 
*ContrMo> :i C.<=<
(<=<) :: Monad m => (b -> m c) -> (a -> m b) -> a -> m c
  	-- Defined in ‘Control.Monad’
infixr 1 <=<
*ContrMo> :i C.=<<
(=<<) :: Monad m => (a -> m b) -> m a -> m b
  	-- Defined in ‘Control.Monad’
infixr 1 =<<
*ContrMo> :i C.>=>
(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> a -> m c
  	-- Defined in ‘Control.Monad’
infixr 1 >=>
*ContrMo> :i C.>>
class Monad (m :: * -> *) where
  ...
  (>>) :: m a -> m b -> m b
  ...
  	-- Defined in ‘GHC.Base’
-} 

{- liftM :: Monad m => (a1 -> r) -> m a1 -> m r
*ContrMo> C.liftM (1+) (Just 3)
Just 4
-}
