module Recuring where

repeatString str n = 
  if n == 0 
  then ""
  else str ++ (repeatString str (n-1))


