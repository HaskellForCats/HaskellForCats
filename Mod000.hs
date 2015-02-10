module Mod where -- Mod.hs -- should be the corresponding file name stored in the root directory.
-- module Foo.Bar.Baz where 
{- is how to create a hierarchical -}



import qualified Data.Set as Set 
import qualified Data.Sequence as Seq 
{- 
import Data.Maybe (Maybe) -- type without constructors
import Data.Maybe (Maybe (Just,Nothing)) -- chosen constructors
import Data.Maybe (Maybe (..)) -- all constructors 
-}
import Control.Monad (Monad) -- imports typeclass but not corresponding functions
import Control.Monad (Monad, return) -- gives us typeclass plus  the function return

