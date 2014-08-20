module TwntyMn001 where
-- : retab 
--: set expandtab ts=4 ruler number spell linebreak

{- 
why should I bother? 

  Pain or Curiosity or Both

Haskell -- not hard so much as 
    radically different.

----------------------------
Some history Some Context --
---------------------------- 
-- languages(Brian).png

C the is language of Unix and everything that follows
   C is to Engineering 
   as
   Java & C# are to business 
   as 
   Haskell is to Mathematics
    it was first developed for experimentation 
    Math and Logic are it's roots 
      I/O was 7 years in the making 
      
    Presently others steal from Haskell 
      the way they used to steal from Smalltalk or Lisp
        ex: 
            cloud-computing 
            successful S.T.M. (Microsoft tried and died) 
            parallelization 



It is not much more complicated than the venerable teaching language Scheme. 
Which was used to teach comp. sci. to M.I.T. students until the switch to Python around circa 2009. 
 

Unlike a teaching language it is Industrial Strength
    Facebook and Google have use it 
    Some big banks use it. 
    

It's as fast as Java out of the box
  as fast as C in certain situations
  on average 24 times faster than Ruby

  
Libraries 
  good quality 
  though not as numerous as Java
      Ryan's experience with Java vs Haskell libs

------------------------------------------------
Some history 
earth cools 
humans displace Neanderthals 
Greeks invent Geometry 



1930's Turing Machine devised by Alan Turing 
short turing bio,
http://amturing.acm.org/acm_tcc_webcasts.cfm

Alonzo Churh (Turing's Professor at Princeton) derives Lambda Calculus 

counting problem in film strip Turing Machine 
https://www.youtube.com/watch?v=WJ-ODmFjmrU
		can speed it up to show cpu speed doubling
					show single threadedness.

1947 Haskell Curry - amplifies Church's simply typed Lambda Calculus and gives us Currying. 
Nothing to do with food version. 
He solved the problem of the one argument, one function stricture so you could have functions with multiple arguments. 
Our name sake for the language mostly because it was the least hated of all the proposed choices.       

1950 procedural instructions and machine code 


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
-- AlGOl and SmallTalk are the primary touchstones for commercial use 
-- for the last 40 years, note Google's GO
----------------------------------------------------------
 

1973
    Robin Milner ML a metalanguage for proof's 

1987 committee forms to design a language using Lambda Calculus, Laziness, and Strict-Static-Typing. 

1990 Haskell 1.0 
    the no I.O. version

1997 Haskell 98
    the I.O. version (via Monads)
    first outdoor Haskell. 

2004 -- processor speeds stopped being easily doubled by adding more transistors as the heat couldn't be dissipated . The Multi-core solution goes on to become the multi-core problem. 

2005 GHC overtakes all the other compilers 
  optimizations for speed and reliability become paramount
  package management via Cabal begins
    http://www.haskell.org/cabal/old.html

2009 Haskell 2010 
  which is 98 + some extras
  programs written for 98 run on 2010, with little or no modification
  (n+k) goes away, because it was obscure and buggy. 
    "was the only major thing they had to take out."
	compare this to ruby 
	1.8.7, 1.9.3, or 2.1 

2013 --> Mio-H_P_MulticoreIO

2013 Evie discovers Haskell and starts Haskell for Cats 
      "because programing is hard and cats are busy"
     
2014 Haskell is poised to become the SmallTalk of 21st Cent. 
      "lets hope for more than that!"

current compiler 
Glasgow Haskell Compilation System a.k.a. "ghc"
ghc 7.8.x (2014)




-- Bruce Tate from Seven Languages in Seven Weeks (p.312)
Final Thoughts
Of the functional languages in the book, Haskell was the most difficult to learn. The emphasis on monads and the type system made the learning curve steep. Once I mastered some of the key concepts, things got easier, and it became the most rewarding language I learned. Based on the type system and the elegance of the application of monads, one day we’ll look back at this language as one of the most important in this book.
Haskell plays another role, too. The purity of the approach and the academic focus will both improve our understanding of programming. The best of the next generation of functional programmers in many places will cut their teeth on Haskell.

-}




