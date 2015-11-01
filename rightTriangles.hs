 module RightTri where 

 -- import PrImEs 
 triples = [(a,b,c) | c <- [1..10], a <-[1..10], b <- [1..10]]

 rightTriangles = [(a,b,c) | c <- [1..10], a <-[1..c], b <- [1..a], a^2+b^2==c^2]  
