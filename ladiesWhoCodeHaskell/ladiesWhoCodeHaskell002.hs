module Lwch002 where 
-- fun with GHC
-- :retab 
-- :set expandtab ts=2 linebreak  
-- :set +s 
-- let fn003 =  fn001 / fn000   
fn003 =  fn001 / fn000 
fn000 =  (6 * (7 + 5 /2)^2) + 2

fn001a :: Int -> Int -> Int 
fn001a x  y = (+) x  y  
fn001 = (+) (6 * (7 + 5 /2)^2) (2 * (product(take 5[1..])))

-------------------
-- fn003 see above
------------------
fn002  x y z  = (/)  (x + y ^ z) w
		where 
		w=2 


fn004 x y z  = x + y ^ z * w  
              where 
              w = sum(head[101..201] : tail[1..100]) 
              a = [] 

------------------------------
-- :i fn004 
----------------------------               

-- quickcheck these 
-- because there are no side effects 
-- their is no state 
-- I don't have to test what the type system will catch
-- I don't have to worry about Strings passed in or Null pointers
myFun001 x y = x + y 
myFun002 a b = a + b 



