module Dice where 
import System.Random


-- next :: g -> (Int, g) 
diceSides = [1,2,3,4,5,6] 
letters = ['A'..'Z']
diceLast = (length diceSides) - 1
diceHead = (head diceSides) -1 
-- diceRand = genRange (diceHead,diceLast)
