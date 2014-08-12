module Lwch005 where 
-- : retab 
-- : set +s 
--  set expandtab ts=4 ruler number spell linebreak
----------------------------
-- Higher Order Functions 
----------------------------
-- Functions as values
-- Functions taking functions as args
pass3 f =  f 3 
-- pass3 (+1)

compost f g x = f (g x) 
-- (+1) (*5) 2

-- :t const 
-- :t const 4  5.5




-- foldl (*) 2 [1..11]
-- foldr (*) 2 [1..11]
-- foldr (-) 0 [1..11]
-- foldl (-) 0 [1..11]
