{-# LANGUAGE NPlusKPatterns #-}
module Ch8ex where 
-- : set expandtab ts=4 ruler number spell
-- enable syntax 
import Test.QuickCheck 
-- import Data.List 
import  qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
import Data.Char 
import Prelude hiding (return,Bool,True,False) 
-- import Data.Tree

-----------------------------------------------------
-- 6:07 --  -- PAPERS --
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
-- ghc      parses      haskell src code
-- ------------------------------------------------
-- linux/bash   parses      shell scripts 
-- ------------------------------------------------
-- firefox      parses      html
-- ----------------------------------------------- 
-- 
-- html is considered hard to parse
-- all programs are parsing in some way 
-- and because we are a using a functional language, no surprise, our parser will be a function.
-- --------------------------------------------
-- Parser is a function that takes Strings and returns Trees.
{-   
type Parser = String -> Tree
             ________________
            |                |
String ---> |                | --------> Tree
            |________________|

alas this is not very combinatory! 

because parsers don't always consume all of what they are given 
type Parser = String -> Tree
-------------------------------
we can do better.            
 
-- type Parser = String -> [(Tree,String)]




-- defining an optional value 
-- because Maybe a is something like [a] 
data Maybe a    = Nothing       -- we could map this to []
                |Just a         -- we could map Just to the [a] singleton list
                                -- -------------------------(a:[])
                                -- we could keep things more basic this way; 
                                -- all the functions of lists are then available to us;
                                -- otherwise we would have to pattern match 
                                -- all the elements that we need 
                                -- to do any useful operations on lists. 

----------------------------------
-- REMEMBER ALGEBRAIC DATA TYPES
----------------------------------
-- Taking something we've seen before
-- Bool only has two constructors False and True. 
-- this is taken right from the Haskell source code

data  Bool = False | True

-- negate gets defined as --  
negate :: Bool -> Bool 
negate True  = False 
negate False = True 
-- and on and on we would have to go to define the rest of what we need. 
-- this is what we would have to do for Maybe a's properties.
--------------------------------------
-- 16:03 ------}

-- for simplicity we will only consider parsers that either fails and return empty list or succeeds and returns a singleton list.
-- in this list of tuples [(a,String)] a will be the value, and String will be the remainder 
type Parser a = String -> [(a,String)] 

failure :: t -> [a]     -- Defined at ch8ex.hs
failure = \inp -> [] 
return :: t -> t1 -> [(t, t1)]  -- Defined at ch8ex.hs
return v = \imp -> [(v, imp)]

item :: [a] -> [[a]]     -- Defined at ch8ex.hs
item = \inp -> case inp of 
                []      -> []
                (x:xs)  -> [(x:xs)]
-- item fails if input is empty, otherwise it consumes the first character                

-- parse applies a parser to a string 
parse :: (t1 -> t) -> t1 -> t    -- Defined at ch8ex.hs
parse p inp = p inp

-- p +++ q  this parser has two behaviors 
-- p when it succeeds 
-- q when it doesn't 
(+++) :: (t -> [(t1, t2)]) -> (t -> [(t1, t2)]) -> t -> [(t1, t2)] -- Defined at ch8ex.hs
p +++ q = \inp -> case p inp of 
                    []          -> parse q inp
                    [(v,out)]   -> [(v,out)] 
