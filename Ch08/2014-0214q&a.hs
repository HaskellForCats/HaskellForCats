module QA where 
-- Are head and tail too fragile to be relied on?
-- why couldn't we use this? 
-- If head and tail are separated from an empty list by the "if" and "then" 
-- are they not safe in this function.   

-- double :: Num a => [a] -> [a] 
-- double nums = 
--     if null nums 
--     then [] 
--     else (2 * (head nums)) : (double (tail nums))


