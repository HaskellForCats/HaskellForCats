module Lwch003 where 
-- fun with GHC
-- :retab 
-- :set expandtab ts=2 linebreak  
-- :set +s 
-- let fn003 =  fn001 / fn000   

fn000 =  (6 * (7 + 5 /2)^2) + 2
fn001 = (+) (6 * (7 + 5 /2)^2) (2 * (product(take 5[1..])))

-------------------
-- fn003 see above
------------------

fn004 x y z  = x + y ^ z * w  
              where 
              w = sum(head[101..201] ++tail[1..100]) 
              a = [] 

------------------------------
-- :i fn004 
----------------------------               

