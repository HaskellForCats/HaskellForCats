{-# LANGUAGE NPlusKPatterns #-}
module Ch8ex where 
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
-- import Data.List 
import  qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
import Data.Char 
{-----------------------------------------------------
--  Chapter 8 parser as special monad
-------------------------------------------------------
parsers analyse text for syntatic structure 

2 * 3 + 4  -- is --
                        + 
                       / \
                      *   4
                     / \
                    2  3
            
            
-}
-- defining an optional value 
data Maybe a    = Nothing  []
                |Just a 

