module lWCH000 here 

-- single line comments 
{- multi-line comments -} 
{- 
What is it? 
  Pure 
    few "real world" compromises
      thus more consistent 
      more thinking before coding

  Functional 
    functions are the primary means of getting things done 
    functions can be passed just like values
    functions are values as well 

  Immutable like mathematics
    for the life of the runtime (until you change it)  
    no swappable shared memory 
      no four horsemen of the parallel apocalypse 
              race conditions 
              priority inversions
              Live Locks 
              Deadlocks
       changes are pointers to new values
        this sounds expensive but it's not
        this sounds restrictive but it's not

  Lazy (opposite of eager)
    nothing gets computed until it is called
      and only so much as is needed
        save resources 
        but can get space and time leaks
    can tackle infinite data sets 

  Statically typed ("strongly")
    stronger than: 
      C or C# or Java or C++ 
        weak static 
          allows for "work around" casting etc.
 
    Haskell "feels" dynamic much of the time   
      because of type inference      
-}    





