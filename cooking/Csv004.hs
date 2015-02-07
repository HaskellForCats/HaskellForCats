{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE -hide-package --ghc-arg=bytestring-0.10.4.1 #-}
-- bytestring-0.10.4.0
-- bytestring-0.10.4.1
-- runhaskell -hide-package --ghc-arg=bytestring-0.10.4.1 Csv004.hs
	-- better in that we get a "No JSON" error instead of type error.

import Data.Aeson 
import qualified Data.ByteString.Lazy as B 
import GHC.Generics

data Mathematician = Mathematician { name :: String
                                   , nationality :: String
                                   , born :: Int
                                   , died :: Maybe Int
                                   } deriving Generic

instance FromJSON Mathematician

main = do
  input <- B.readFile "input.json"
  let mm = decode input :: Maybe Mathematician
  case mm of
    Nothing -> print "error parsing JSON"
    Just m -> (putStrLn.greet) m
    
greet m = (show.name) m ++" was born in the year "++ (show.born) m

