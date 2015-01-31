module Nads where 
{-
unit instead of return

★ instead of bind 

------------------------}
-- Basic actions in IO monad have “side
-- Reviewing IO Monad



echo :: IO ()

echo = do { b <- isEOF;
            if not b then do
              { x <- getChar; putChar x; echo }
            else return () }

