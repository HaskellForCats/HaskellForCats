module MyList where 

{-
Binary vs. Linear Searching

Write an example demonstrating Binary Search. 
Write an example demonstrating Linear Search. 
Hint: A linear search looks down a list, one item at a time, without jumping.

In complexity terms this is an O(n) search - the time taken to search the list gets bigger at the same rate as the list does. 



A binary search is when you start with the middle of a sorted list, and see whether that's greater than or less than the value you're looking for, which determines whether the value is in the first or second half of the list.
-}

mylist1 x ys = elem x ys 

-- mylist2 xs [] = []
mylist2 xs = splitAt (div (length xs)2) xs  

-- mylist3 xs = 


 --myList3 xs = (lenth xs) 
