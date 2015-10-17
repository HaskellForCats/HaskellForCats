module RomanNum where 
import Data.Char (toUpper) 
-- 
-- When I enter $number
-- Then $numeral is returned

data RomanNumber  = M1000 | D500 | C100 | L50 | X10 | V5 | I | None
					deriving (Eq, Ord, Show, Read, Bounded, Enum)
-- base values -- 
thousands m = (m - 1000)
fivehundreds d = 500
hundreds c = 100
fifties l = 50 
tens  t = 10 
fives f = 5 
ones i = 1 




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