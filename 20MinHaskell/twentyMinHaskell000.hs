module TwntyMn000 where 
-- : set expandtab ts=4 ruler number spell linebreak
-- : retab 
-- single line comments 
{- multi-line comments -} 
{- 
Who am I? 
Basic -> in high school, my rather unremarkable intro to programming littered with GOTOs
Pascal -> College gave me the sense of being cheated in that I couldn't use it anywhere.
Assembly -> College let me with impression that programming was a shit-ton of work
C/C++ -> same as above
tech support 
    a better understanding of hardware
sys admin 
    a better understanding of networking
Java for Android -> intro to programming as pain driven development. 
GO -> exciting but not ready for prime-time; that has since changed.
Lisp -> Intro to what was possible but the painful realization that I wouldn't get to use it anywhere that I would get a job. 
JavaScript -> Loved it at first. Easiest install ever; now I fear it like the plague. 
Php -> useful and quick //  but a hot-mess
Ruby -> okay, kind of a Lisp with objects.  
Rails -> to many magical W.T.F.s per minute; 
Clojure -> A Romance but tainted by excessive dinosaur care .
Haskell -> Awe inspiring 
Objective-C -> a Faustian bargain for $$$$$  
Swift -> Great but not ready for prime time just yet.
F# -> about as close to Haskell I was gonna get and get paid for it.
Prolog -> good that I hadn't experienced it before Haskell.
C# -> another fuastian bargin I made for $$$$$.
 
Spent about 2+ years proving to my self, Paul Graham's observation that there all of professional programming is some derivation of  Lisp and/or C. 
Haskell is my Lisp, presently C# is my C. 
I consider Clojure as my first love, 
but Haskell turned out to be marriage material. 



What is it? 
http://www.haskell.org/haskellwiki/Haskell
  Pure 
    no "real world" compromises
      thus more consistent 
      few W.T.F.s  

  Purely Functional 
    functions are the primary means of getting work done 
    functions can be passed as values. 
    functions are values.
    functions are easier to reason about than are objects
        see smalltalk example: twentyMinHaskell000a.hs 
    2+3=5
    2+3=5 ± 1  

  Immutable like mathematics
    for the life of the runtime (until you change it)  
    no swappable shared memory
        because shared swappable memory is the devil 
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
        save on resources 
    can tackle infinite data sets 

  Statically typed ("strongly" "not weakly") 
    no casting cheats
    no wrapping cheats
    by stronger we mean stronger than: 
      C or C# or Java or C++ 
        weak static 
          allows for some coersion of types.

  Parallelization 
    turns out that purity, laziness, immutability, and static typing make Parallelization easier
    
  Concision about as much code as Ruby but 25x faster. 
 
    Haskell "feels" dynamic most of the time   
      because of type inference thanks to the Hindley-Milner type system.


 

-- Haskell lets you play with sharp objects and not cut yourself. 
Video --  knife game.
https://www.youtube.com/watch?v=DzjMKM9449M

The ass you save may be your own.

-}    





