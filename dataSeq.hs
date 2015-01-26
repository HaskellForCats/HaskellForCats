module DataSeq where 
import Data.Sequence
{- # LANGUAGE ViewPatterns #-} 
-- (<|) :: a -> Seq a -> Seq a
mySeq = empty 
my2Seq = 2 <| mySeq
my3Seq = empty  

