{-# LANGUAGE OverloadedStrings #-} 
import Blaze.ByteString.Builder           (Builder, fromByteString)
import Blaze.ByteString.Builder.Char.Utf8 (fromShow)
import Control.Concurrent                 (threadDelay)
import Control.Monad                      (forM_)
import Control.Monad.Trans.Class          (lift)
import Data.Monoid                        ((<>))
import Network.HTTP.Types                 (status200) 
import Network.Wai                        (Application, responseStream)
import Network.Wai.Handler.Warp           (run)



main :: IO ()
main = run 3000 app 

app :: Application 
app _req sendResponse = sendResponse $ responseStream
    status200 
     [("Content-Type", "text/plain")]
     myStream 

myStream :: (Builder -> IO ()) -> IO () -> IO  () 
myStream send flush = do 
    send $ fromByteString "Starting streaming reponse.\n"
    send $ fromByteString "performing IO . \n"
    flush
    -- mocking  IO ---
    threadDelay 1000000 
    send $ fromByteString "IO results!!!\n"
    forM_ [1..50 :: Int] $ \i -> do 
        send $ fromByteString " Got Value: " <> 
                fromShow i <> 
                fromByteString "\n"
