module RomanNum where 
import Data.Char (toUpper) 
-- 
-- When I enter $number
-- Then $numeral is returned

data RomanNumber  = M1000 | D500 | C100 | L50 | X10 | V5 | I | None
					deriving (Eq, Ord, Show, Read, Bounded, Enum)
-- base values -- 
thousands m = if m > 1000 then thousands (m - 1000) else m 
fivehundreds d = if d > 500 then (fivehundreds (d - 500)) else d 
hundreds c = if c > 100 then (hundreds (c - 100)) else c 
fifties l = if l > 50 then (fifties (l - 50)) else l  

tens t 
	| t > 50  = (tens (t - 50))
	| t > 10  = (tens (t - 10)) 
	| t > 5   = (tens (t - 5))
	| t > 1   = (tens (t - 5))
	| otherwise = t 

fives f = if f > 5 then (fives (f - 5)) else f  
ones i = if i > 1 then (ones (i - 1)) else i




none = 0 
main = do 
	inChar <- getChar
	let upChar = toUpper inChar 
	-- after made to upper 
	print upChar


 

				{- where 
					a == '' = ''
					otherwise '0' 
-}
{-	
	I   1
	V	5
	X	10
	L	50
	C	100
	D	500
	M	1,000
-}