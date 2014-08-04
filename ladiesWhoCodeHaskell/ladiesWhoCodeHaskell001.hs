module lWCH001 where
{- 
why should I bother? 
  Pain or Curiosity or Both

it's not hard so much as very different.
  the other side of galaxy

                        Fortran
                      /       \
                     /         \
                    /           \ 
                Algol           Lisp
               /  |               |
      Simula-67   |             
                 Algol-68        
    
  
 SmallTalk    /                   SML
  
                                   |
            / | C++                |
              |  |              Haskell
              |Java
              |  |
              |  C#
                
        




                                  Haskell 1.0 -1990

           
C the language of Unix and everything that follows
   C is to Engineering 
   as
   Java & C# are to biz
   as 
   Haskell is to Math 
    it was for experimentation 
    Math and Logic are it's roots 
      I/O was 7 years in the making 
      Others steal from Haskell 
      the way they used to steal from SmallTalk or Lisp
        ex: 
            cloud-computing 
            successful STM (MicroSoft tried and died) 
            parallelization 

It is not much more complicated than the venerable teaching language Scheme. 
Which was used to teach comp. sci. to M.I.T. students until the switch to Python around circa 2009. 
 

Unlike a teaching language it is Industrial Strength
    Facebook and Google have uses for it 
    Some big banks use it. 
    

It's as fast as Java out of the box
  as fast as C in certain situations
  on average 24 times faster than Ruby
  
Libraries 
  good quality 
  though not as numerous as Java
      Ryan's experience with Java vs Haskell libs


Some history 
earth cools 
humans displace Neanderthals 
Greeks invent Geometry 
 earning the ire of high school students for ever after

1930's Turing Machine from Alan Turing as alternative to to his Professor Alonzo Church and his Lambda Calculus

1947 Haskell Curry - amplifies Church's simply typed Lambda Calculus and gives us Currying. Not the food version. He solved the problem of the one argument, one function stricture so you could have functions with multiple arguments. Our name sake for the language mostly because it was the least hated of the proposed choices.       

1957 Lisp a riff on lambda calculus  

1968 Algol 68
      Go is a redo of this and C 

1972
    Dennis Richie's C language 
      because A and B didn't work.
      It's so good it refuses to die
      it shows up everywhere because it works where resources are tight, and performance must be pushed to the limit.
       even C++ and GO use more resources 
        Java and C# way more still
     
        even things that aren't it are made to look like it
       JavaScript & PHP 

--------the-great--divide---------------------------------
-- AlGOl and SmallTalk are the primary touchstones for commercial usage for the last 35 years, note Google's GO
----------------------------------------------------------
 

1973
    Robin Milner ML a metalanguage for proof's 

1987 committee forms to design a language using Lambda Calculus, Laziness, and Strict-Static-Typing. 

1990 Haskell 1.0 
    the no I.O. version

1997 Haskell 98
    the I.O. via Monad version
    first outdoor Haskell. 

2005 GHC overtakes all the other compilers 
  optimizations for speed and reliability become paramount
  package management via Cabal begins
    http://www.haskell.org/cabal/old.html

2009 Haskell 2010
  which is 98 + some extras
  programs written for 98 run on 2010 with little or no modification
  (n+k) goes away, because it was obscure and buggy. 
    "was the only major thing they had to take out."
2013 Evie discovers Haskell and starts Haskell for Cats 
      "because programing is hard and cats are busy"
     
2014 Haskell is poised to become the SmallTalk of 21st Cent. 
      "lets hope for more than that!"

current compiler 
Glasgow Haskell Compilation System a.k.a. "ghc"
ghc 7.8.x (2014)
  
-}



