module IfTheElse where 
-- : set number linebreak expandtab ts=4 
-- syntax enable
-- retab 
posOrNeg x = 

    if x >= 0 
    then "Pos" 
    else "Neg"  

-- *IfTheElse> posOrNeg (-5)
-- "Neg"
-- *IfTheElse> posOrNeg 5
-- "Pos"
-- *IfTheElse>


