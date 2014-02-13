---------------------------
-- Multiline in the repl --
---------------------------
{-

:{ 
1/2 + 
1/3 
:} 

Prelude> :{ 
Prelude| 1/2 + 
Prelude| 1/3 
Prelude| :} 
0.8333333333333333
-}
------------------
-- IF THEN ELSE --
------------------
-- the entire if statement must return a value 
-- BOTH T AND F EXPRESSIONS MUST BE OF THE SAME TYPE
fn001 :: Num a => Bool -> a
fn001 n = if n == True then 1 else 2 
-- *Main>  fn001 False 
-- 2

{- this wont compile:  
fn002 n = if n == True then "hello" else 2 
2014-0212mena001.hs:26:42:
    No instance for (Num [Char]) arising from the literal `2'
    Possible fix: add an instance declaration for (Num [Char])
    In the expression: 2
    In the expression: if n == True then "hello" else 2
    In an equation for `fn002':
        fn002 n = if n == True then "hello" else 2
-}
-- Prelude> if 3 < 4.5 then "3 is less than 4.5" else "is not less than 4.5" 
-- "3 is less than 4.5"
-- *Main> if 5 < 4.5 then "3 is less than 4.5" else "is not less than 4.5" 
-- "is not less than 4.5" 

safeHead [] = [] 
safeHead (x:xs) = ((length xs) - 1)  
