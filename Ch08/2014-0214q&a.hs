module QA where 
-- head and tail are fragile!
-- why couldn't we use this? 
-- If head and tail are spare an empty list by the "if" and "then" are they not always safe in this function.   

-- double :: Num a => [a] -> [a] 
-- double nums = 
--     if null nums 
--     then [] 
--     else (2 * (head nums)) : (double (tail nums))


