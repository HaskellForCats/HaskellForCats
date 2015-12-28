{- # LANGUAGE NoImplicitPrelude #-}
module Feb12 where 
import qualified Prelude as P
{- 
-----------------------------------------------------------------------------------
--  In constructing our own data types we encountered all manner of name collisions
-----------------------------------------------------------------------------------
ghci .\2014-0212dataBool.hs
GHCi, version 7.6.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
[1 of 1] Compiling Feb12            ( 2014-0212dataBool.hs, interpreted )

2014-0212dataBool.hs:7:9:
    Ambiguous occurrence `False'
    It could refer to either `Feb12.False',
                             defined at 2014-0212dataBool.hs:5:13
                          or `Prelude.False',
                             imported from `Prelude' at 2014-0212dataBool.hs:2:8-12
                             (and originally defined in `GHC.Types')

2014-0212dataBool.hs:7:17:
    Ambiguous occurrence `True'
    It could refer to either `Feb12.True',
                             defined at 2014-0212dataBool.hs:5:21
                          or `Prelude.True',
                             imported from `Prelude' at 2014-0212dataBool.hs:2:8-12
                             (and originally defined in `GHC.Types')
------------------------------------------------------------------------------------------
-- the solutions where qualified import of Prelude or  {- # LANGUAGE NoImplicitPrelude #-}
-}

data Bool = False | True  

not   False = True 
not   True = False 

aNd False q = False 
aNd True  q = q 

oR False q = q 
oR True  q = True

eQbool False False = True
eQbool True  True  = True 
eQbool _     _     = False

showBool False = "False" 
showBool True  = "True" 

