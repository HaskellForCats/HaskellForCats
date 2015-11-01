{-# LANGUAGE OverloadedStrings, TypeSynonymInstances, FlexibleInstances #-}
-- module Phunctor where 
import Data.Text (Text)
class IsString a where 
	fromString :: String -> a 
class DoSomething a where 
	something :: a -> IO ()
instance Class DoSomething where
	something _ = putStrLn "String"
instance DoSomething Text where 
	something _ = putStrLn "Text" 

myFunc :: IO () 
myFunc = something "hello"
--	func = 
-- myFmap :: Functor f => (a -> b) -> f a -> f b
-- myFmap _ [] = [] 
-- myFmap g (x:xs) = g x : myFmap g xs 
-- myFmap' _ Nothing = Nothing
-- myFmap' g (Just a) = Just (g a) 
--f x = x^3
--g x = x + x + x
--(f . g) x = f (g x)


