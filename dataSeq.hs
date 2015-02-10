module DataSeq where 
import Data.Sequence
{- # LANGUAGE ViewPatterns #-} 
-- (<|) :: a -> Seq a -> Seq a
mySeq = empty 
my2Seq = 2 <| mySeq
my3Seq = empty  
{-
*DataSeq> 1 <| (my2Seq ><  (my3Seq |>  3))
fromList [1,2,3]
-- my2Seq ><  my3Seq
-- my2Seq ><  (my3Seq <| 2)

:set -XViewPatterns
-}
