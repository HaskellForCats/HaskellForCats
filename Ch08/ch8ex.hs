{-# LANGUAGE NPlusKPatterns #-}
module Ch8ex where 
-- : set expandtab ts=4 ruler number spell
import Test.QuickCheck 
-- import Data.List 
import  qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
import Data.Char 

-----------------------------------------------------
-- 6:07 -- 	-- PAPERS --
----------------------------------
-----------------------------------------------------
--  Chapter 8 parser as special monad
-------------------------------------------------------
parsers analyse text for syntactic structure 
because a string is just a list of [Char] 
-------------------------------
2 * 3 + 4  -- is --
                        + 
                       / \
                      *   4
                     / \
                    2  3


Because of the structure of our tree, addition is further away than multiplication; starting from the bottom and working way up, shows this tree conforming to the order of operations.  

COOLNESS! I think.

-------------------------------            




-- defining an optional value 
data Maybe a    = Nothing  []
                |Just a 


