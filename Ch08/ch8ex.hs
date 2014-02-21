{-# LANGUAGE NPlusKPatterns #-}
module Ch8ex where 
-- : set expandtab ts=4 ruler number spell
-- enable syntax 
-- 
import Test.QuickCheck 
-- import Data.List 
import  qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
import Data.Char 

-----------------------------------------------------
-- 6:07 -- 	-- PAPERS --
----------------------------------
-----------------------------------------------------
--  CHAPTER 8 PARSER AS SPECIAL CASE MONAD!
-------------------------------------------------------
-- text tends to be unstructured data so we will take it in and parse it. 
-- parsers analyse text for syntactic structure 
-- because strings are just a  [[Char],[Char]] etc.  
-- we can add more structure a tree. 
-- 
-- -------------------------------
-- 2 * 3 + 4  -- is --
--                         + 
--                        / \
--                       *   4
--                      / \
--                     2  3
-- 
-- 
-- Because of the structure of our tree, addition is further away than multiplication; starting from the bottom and working our way up; the multiplication of 2*3 is bound, tighter and closer than is addition.  
-- This way our tree conforms to the order of operations. Just like in real math. 
-- 
-- Our parser will take strings in and make data trees that have a hierarchal structure to them.   
-- COOLNESS! I think.
-- 

-- NOTE! PREPROCESSING IS EVERYWHERE 
-- -------------------------------------------------
-- ghc 		parses 		haskell src code
-- ------------------------------------------------
-- linux/bash 	parses 		shell scripts 
-- ------------------------------------------------
-- firefox		parses 		html
-- ----------------------------------------------- 
-- 
-- html is considered hard to parse
-- all progs are parsing in some way 
-- and because we are a using a functional language, no surprise, our parser will be a function.
-- --------------------------------------------
-- Parser is a function that takes Strings and returns Trees.
{-   
type Parser = String -> Tree
	  ______________
	  |		|
String--->|		|---------> Tree
	  |_____________|

alas this is not very combinatory! 

because parsers don't always consume all of what they are given 
type Parser = String -> Tree
-------------------------------
we can do better.            
-} 
type Parser = String -> [(Tree,String)]




-- defining an optional value 
data Maybe a    = Nothing  []
                |Just a 


