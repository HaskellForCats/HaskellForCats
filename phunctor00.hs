{-# LANGUAGE OverloadedStrings, TypeFamilies #-}
import Data.Word (Word8) 
import qualified Data.ByteString as S 
import Data.ByteString.Char8 () -- 

class SafeHead a where 
	type Content a 
	safeHead :: a -> Maybe (Content a) 

instance  SafeHead [a] where 
	type Content [a] = a 
	safeHead [] = Nothing 
	safeHead (x:_) = Just x 
instance SafeHead S.ByteString where 
	type Content S.ByteString = Word8 
	safeHead bs 
	| S.null bs = Nothing 
	| otherwise = Just $ S.head bs 

main :: IO ()
main =  do 
	print $ safeHead (""::String)
	print $ safeHead ("hello" :: String)

	print $ safeHead (""::S.ByteString)
	print $ safeHead ("hello" :: S.ByteString)	


module Phunctor00 where 
-- myFmap :: Functor f => (a -> b) -> f a -> f b
-- myFmap _ [] = [] 
-- myFmap g (x:xs) = g x : myFmap g xs 
-- myFmap' _ Nothing = Nothing 
-- myFmap' g (Just a) = Just (g a) 
--f x = x^3
--g x = x + x + x
--(f . g) x = f (g x)

