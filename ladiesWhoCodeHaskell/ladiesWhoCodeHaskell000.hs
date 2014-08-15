module Lwch000 where 
-- : set expandtab ts=4 ruler number spell linebreak
-- : retab 
-- single line comments 
{- multi-line comments -} 
{- 
Who am I? 
Basic -> Pascal -> C/C++ -> 
GO -> Java -> JavaScript -> Php -> Rails -> Clojure -> Haskell -> Objective-C.
Spent about 2 years proving to my self, that there is Lisp and There is C. 
Haskell is my Lisp, presently Objective-C is my C. 
I still consider Clojure as my first love, 
but Haskell turned out to be marriage material; 
but if I was going to cheat it would be with Clojure;) 



What is it? 
http://www.haskell.org/haskellwiki/Haskell
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
		less time leaks than ....
      and only so much as is needed
        save resources 
        but can get space leaks
		
    can tackle infinite data sets 

  Statically typed ("strongly") no cheats
    stronger than: 
      C or C# or Java or C++ 
        weak static 
          allows for "work around" casting etc.
 
    Haskell "feels" dynamic much of the time   
      because of type inference      

-- Haskell lets you play with sharp objects and not cut yourself. 
Video --  knife game.
https://www.youtube.com/watch?v=DzjMKM9449M

If there are three developers or more ... 
Static typing elimates a lot of idiot code. 

And may save lives.

-}    





