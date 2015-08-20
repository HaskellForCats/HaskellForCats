module Algo where 

collection1 = [7,5,20,14,99]
lowLocation = 0 
length1 = length collection1  
highLocation = length1 - 1
splitMiddleValue = splitAt (div highLocation 2) collection1
fn001 = head splitMiddleValue 
