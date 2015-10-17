module Tonos where 

pitches = ["x0","x1","x2","x3","x4","x5","x6","x7","x8","x9","x10","x11"]   
{- 
lydian = 		["x0","x2","x4","x6","x7","x9","x11"]
majorIonian = 	["x0","x2","x4","x5","x7","x9","x11"]
mixoLydian = 	["x0","x2","x4","x5","x7","x9","x10"]
dorian = 		["x0","x2","x3","x5","x7","x9","x10"]
natural = 		["x0","x2","x3","x5","x7","x8","x10"]
phrygian = 		["x0","x1","x3","x5","x7","x8","x10"]
locrian =       ["x0","x1","x3","x5","x6","x8","x10"]
-}
lydian =        [0,2,4,6,7,9,11]
majorIonian =   [0,2,4,5,7,9,11]
mixoLydian =    [0,2,4,5,7,9,10]
dorian =      	[0,2,3,5,7,9,10]
natural =       [0,2,3,5,7,8,10]
phrygian =      [0,1,3,5,7,8,10]
locrian =       [0,1,3,5,6,8,10]

lydianSum = sum lydian 
majorIonianSum = sum majorIonian
mixoLydianSum = sum mixoLydian 
dorianSum = sum dorian 
aolianNaturalSum = sum natural
phrygianSum = sum phrygian
locrianSum = sum locrian
