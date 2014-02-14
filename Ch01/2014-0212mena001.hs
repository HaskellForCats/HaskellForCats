module Feb13 where 

---------------------------
-- Multiline in the repl --
---------------------------


-- :{ 
-- 1/2 + 
-- 1/3 
-- :} 
-- 
-- Prelude> :{ 
-- Prelude| 1/2 + 
-- Prelude| 1/3 
-- Prelude| :} 
-- 0.8333333333333333

------------------
-- IF THEN ELSE --
------------------
-- the entire if statement must return a value 
-- BOTH T AND F EXPRESSIONS MUST BE OF THE SAME TYPE
fn000 :: Num a => Bool -> a
fn000 n = if n == True then 1 else 2 
-- *Main>  fn001 False 
-- 2

-- this wont ever compile because of miss matched types in the then vs the else.   
-- fn002 n = if n == True then "hello" else 2 
-- 2014-0212mena001.hs:26:42:
--     No instance for (Num [Char]) arising from the literal `2'
--     Possible fix: add an instance declaration for (Num [Char])
--     In the expression: 2
--     In the expression: if n == True then "hello" else 2
--     In an equation for `fn002':
--         fn002 n = if n == True then "hello" else 2

-- Prelude> if 3 < 4.5 then "3 is less than 4.5" else "is not less than 4.5" 
-- "3 is less than 4.5"
-- *Main> if 5 < 4.5 then "3 is less than 4.5" else "is not less than 4.5" 
-- "is not less than 4.5" 

-- 2.11 -- 
-- 2.11.1 -- 
-- *Feb13> ('a':('b':('c':[]))):[]
-- ["abc"]
-- *Feb13> ('d':('e':[])):[]
-- ["de"]

--
-- 2.11.1.2 -- check for me if the list is empty! 
-- is there a function that already does this ? yes, null 
-- *Feb13> let fn001 x = null x 
-- null :: [a] -> Bool     -- Defined in `GHC.List'
fn001 :: [a] -> Bool
fn001 x = null x
fn002 :: Eq a => [a] -> Bool
fn002 x =  if x /= [] then False else True 
-- *Feb13> null []
-- True 
-- so null [] == "our function" 
-- *Feb13> null [] == if [] == [] then True else False
-- True
-- *Feb13> let fn002 x =  if x /= [] then False else True
-- *Feb13> fn002 []
-- True
-- *Feb13> fn002 [1]
-- False 
-- ----------------------------------------------------
-- 2.11.1.3 -- check for me if the head of the list is an empty list! 
-- our fn003 function produces [x]!!0 == [] else False 
-- if [x]!!0 /= [] then False else True 
-- *Feb13> let fn005 xs = head xs  ++ []
-- *Feb13> fn005 ["abc","xyz"]
-- "abc"
-- *Feb13> let fn005 xs = tail xs ++ []
-- *Feb13> let fn005 xs = tail xs ++ []
-- *Feb13> fn005 ["abc","xyz"]
-- ["xyz"] 
-- -----------------------------------------------------------
-- 2.11.1.4 -- concats so that ["abc","xyz"] returns "abcxyz" 
-- we have to halves, as two seperate steps
-- and then if we wrap those each in lists we get  
fn005 xs =  concat(head xs:tail xs)
fn006 xs = concat xs 
-- -------------------------------------------------------
