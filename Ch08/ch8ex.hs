{-# LANGUAGE NPlusKPatterns #-}
module Parsing where 
-- : set expandtab ts=4 ruler number linebreak        
-- : set spell 
-- syntax enable 
-- retab
-- import Data.List 
-- import Data.Tree
-- import Test.QuickCheck 
-- import  qualified Data.Attoparsec.ByteString.Char8 as A -- for isDigit 
-- import GHC.Unicode hiding (isDigit)
import Data.Char -- hiding (isDigit)  
import Prelude hiding (return,Bool,True,False) 
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
-- html is considered some what hard to parse
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

-------------------------------
because parser doesn't  always consume 
all of what it is given
we need to do something with the remaining. 
-- type Parser = String -> Tree
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

-- return v = \imp -> [(v, imp)] -- this compiled but was flawed 
return :: t -> t1 -> [(t, t1)]  -- Defined at ch8ex.hs
return v = \inp -> [(v, inp)]

item :: [t] -> [(t, [t])]   -- Defined at ch8ex.hs
item = \inp -> case inp of 
                    []      -> []
                    (x:xs)  -> [(x,xs)] 

-- getting this wrong with a : instead of a , (x:xs)  -> [(x:xs)]
-- item fails if input is empty, otherwise it consumes the first character                

-- (+++) is an infix operator that has two behaviors p and q  
-- p when it succeeds 
-- q when it doesn't 
-- this combinator behaves like "choice"
(+++) :: (t -> [(t1, t2)]) -> (t -> [(t1, t2)]) -> t -> [(t1, t2)] -- Defined at ch8ex.hs
p +++ q = \inp -> case parse p inp of 
                       []          -> parse q inp  -- failure returns empty list 
                       [(v,out)]   -> [(v,out)]    -- success is getting v and  

-- like a recursive decent parser but as a case 
-- note!! :t out --  is not in scope cause it's within the case body. 

-- parse applies a parser to a string 
-- parse :: (t1 -> t) -> t1 -> t    -- Defined at ch8ex.hs
parse p inp = p inp     -- this function is sort of unnecessary because all we get from it is the identity function but it has the value of making the type conversion explicit.  
 
{- -- some console examples -- 

*Parsing> parse item ""
[]

*Parsing> parse item "abc"
[('a',"bc")]
   
*Parsing> parse failure "abc"
[]

*Parsing> parse (return 1)  "abc"
[(1,"abc")]

*Parsing> parse (item +++ return 'd') "abc"
[('a',"bc")]

*Parsing> parse (failure +++ return 'd') "abc"
[('d',"abc")]

-} 

-- monad 
-- M a  -- M is the computation (process) that delivers a to us.
-- the monad's type abstracts away the internals  

-- Sequencing 
-- a sequence of parsers can be combined as a single composite parser using the keyword do. 
-- remember list comprehensions, <- [1..] these were generators 
-- in the do block we draw from item; p = do x <- item  
-- item has type Parser and x will have type a.    
-- p :: Parser (Char,Char) 
p = do x <- item        
       item          -- | no return here so we use empty space or _ 
       y <- item 
       return (x,y) 




{- 
ghc makes this suggestion: 
   do { x <- item;
        item;
        y <- item;
        return (x, y) }


p' = do { x <- item        
        ; _ <- item -- we aren't returning this one so we could use _ or empty space or ...
        ; y <- item 
        ; return (x,y) 
        }
-}
-- value returned by the last parser is the value returned by the sequence as a whole. 
{-
*Parsing> :t p
p :: [t] -> [(([(t, [t])], [(t, [t])]), [t])]
*Parsing> :t p'
p' :: [t] -> [(([(t, [t])], [(t, [t])]), [t])]

*Parsing> parse p "abcdef"
Loading package array-0.4.0.1 ... linking ... done.
Loading package deepseq-1.3.0.1 ... linking ... done.
Loading package bytestring-0.10.0.2 ... linking ... done.
Loading package text-0.11.3.1 ... linking ... done.
Loading package old-locale-1.0.0.5 ... linking ... done.
Loading package time-1.4.0.1 ... linking ... done.
Loading package random-1.0.1.1 ... linking ... done.
Loading package containers-0.5.0.0 ... linking ... done.
Loading package attoparsec-0.10.4.0 ... linking ... done.
Loading package pretty-1.1.1.0 ... linking ... done.
Loading package template-haskell ... linking ... done.
Loading package QuickCheck-2.6 ... linking ... done.
[(([('a',"bcdef")],[('a',"bcdef")]),"abcdef")]
-}

-- (>>=) our bind operator

-- sat :: ([(t, [t])] -> GHC.Types.Bool) -> [t] -> [([(t, [t])], [t])] 
sat p = do  x <- item 
            if      p x  
            then    return x 
            else    failure 


-- digit ::
--   ([(t, [t])] -> GHC.Types.Bool) -> [t] -> [([(t, [t])], [t])]
digit = sat  -- isDigit
-- why is this thing choking on isDigit?  
-- is it where isDigit is coming from? 
-- what if I use the Hutton's version 
-- isDigit c = c >= '0' || c<='9'  
-- isDigit :: Char -> GHC.Types.Bool       -- Defined in `GHC.Unicode'
-- did all that hiding to end up with the same I started with error
-- ch8ex.hs:225:14:
--  Couldn't match type `Char' with `[(t0, [t0])]'
--   Expected type: [(t0, [t0])] -> GHC.Types.Bool
--      Actual type: Char -> GHC.Types.Bool
--       In the first argument of `sat', namely `isDigit'
--        In the expression: sat isDigit
--         In an equation for `digit': digit = sat isDigit 
--
-- so do I need to add an instance of some sort? 
-- expected type [(t0, [t0])] seems like a reasonable expectation 
-- char :: Eq t => [(t, [t])] -> [t] -> [([(t, [t])], [t])]
char x = sat (x ==) 

{-
many p  = many1 p +++ return [] 
many1 p = do    v   <- p 
                vs  <- many p 
                return (v:vs)
-}
string :: Eq t => [[(t, [t])]] -> [t] -> [([[(t, [t])]], [t])]
string []       = return [] 
string (x:xs)   = do    char x 
                        string xs 
                        return (x:xs) 

{-
p1 = do  char '[' 
        d   <- digit 
        ds  <- many (do char ',' digit) 
        char ']' 
        return (d:ds)  
-- praser that does simple math 
--------- BNF ------------------
expr    -> term '+' expr | term 
term    -> factor '*' term | factor 
fator   -> digit | '(' expr ')'
digit   -> '0'  |   '1' | ...| '9'
-------------------------------
expr -> term ('+' expr | "")
term -> factor ('*' term | "") 
-----------------------------
-} 
------- code for BNF -------- 
expr = do t <- term 
          do char '+' 
             e <- expr 
             return (t + e) 
          +++ return t 

term = do f <- factor 
          do char '*' 
             t <- term 
             return (f * t) 
          +++ return f 

factor = do d <- digit 
            return (digitToInt d) 
         +++ do char '(' 
                e <- expr 
                char ')'
                return e 
