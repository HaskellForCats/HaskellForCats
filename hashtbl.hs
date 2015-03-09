import Control.Monad
-- import qualified Data.HashTable as H
import qualified Data.HashTable.IO as H
main = do
    m <- H.new (==) H.hashInt
    forM_ [1..10000000] $ \n -> H.insert m n n
    v <- H.lookup m 100
    print v

