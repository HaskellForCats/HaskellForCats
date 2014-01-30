{- module Jan27Emacs where 
"Sweet crashing Emacs" 
three files and twice as many buffers and too much flipping arround.

emacs doesn't believe in overwriting?


didn't want to take the last input.  But what if we reverse the order? 
-- prf_drop2 = (drop 3 [1,2,3,4,5] == drop 2 [2,3,4,5]) == (drop 1 [3,4,5]== drop 0 [4,5]) == [4,5] 
-}
prf_drop2 = (drop 0 [4,5]== [4,5]) == ((drop 3 [1,2,3,4,5] == drop 2 [2,3,4,5]) == (drop 1 [3,4,5]== drop 0 [4,5]))