HaskellForCats
==============

For Haskell Explication and Perpetuation 

Haskell_For_Cats: Because Haskell can be hard, and cats are busy, but if they can do it so can you.

We gonna take Haskell by storm, with a book and video series. We will meet every two weeks and knock off a couple of chapters and accompanying videos. By the time we are done we will be Hask(>>=)Kats, which are side-effect free happy kitties after they grow up.

Join the Meetup: http://www.meetup.com/Haskell_For_Cats/

Please download and install the G.H.C. (Glasgow Haskell Compiler) which is part of: http://www.haskell.org/platform/

For OSX-Maverick here's some special instructions, thanks to Kat: http://haskell-workshop.github.io/tutorials/osx/2013-10-23-mavericks-ghc.html

here is the link to the Erik's video: https://channel9.msdn.com/Series/C9-Lectures-Erik-Meijer-Functional-Programming-Fundamentals/Lecture-Series-Erik-Meijer-Functional-Programming-Fundamentals-Chapter-1

Slides http://www.cs.nott.ac.uk/~gmh/book.html

NOTE! the Haskell-platform, has all the tools we'll need and then some. The book and video both use the deprecated Hugs compiler; it works okay; but the renowned Glasgow Haskell Compiler 7.6.x included in the Haskell-platform, is the current standard.

When it's installed and you open a command prompt (terminal) and type ghci you should get the prelude prompt, Prelude>. And you are ready to go.

Those using windows might have an easier time with WinGHCi, which makes loading modules easier.

Any text editor will do, but some do a better job of highlighting and such. Popular choices are Emacs, Vim, and Sublime. It's a good idea to set tabs to spaces otherwise GHC will complain.

Extra Haskell goodness from "Learn your a Haskell for greater good": http://learnyouahaskell.com/chapters

Good video for early chapters of "Learn You a Haskell . . ." http://www.cs.nott.ac.uk/~gmh/book.html

answers to questions in Hutton's book. http://www.cs.nott.ac.uk/~gmh/book.html

Some general tips on programming in Haskell. http://www.haskell.org/haskellwiki/Haskell_programming_tips

FootNotes: * the 40 cores ref: http://haskell.cs.yale.edu/wp-content/uploads/2013/08/hask035-voellmy.pdf

Additonal resources. . . . Brian Hurt's wonderful explication of the why of static typing. http://vimeo.com/72870631

Brian Beckman explained the monand so well even my cat gets it. http://channel9.msdn.com/Shows/Going+Deep/Brian-Beckman-Dont-fear-the-Monads

Brian Beckman interviews Rich Hickey: two of the greatest explicators in a single video. http://channel9.msdn.com/Shows/Going+Deep/Expert-to-Expert-Rich-Hickey-and-Brian-Beckman-Inside-Clojure

-- settings and such -- Erik Meijer makes much use of (n + k) which has been dropped from the Haskell 2010 spec. So as not to get an error when compiling you want to do either of these two steps. start the compiler with this command ghci -XNPlusKPatterns

or

use this at the top the module

{-# LANGUAGE NPlusKPatterns #-}

to kill the monomorphic resriction ghci prompt > :set -XNoMonomorphismRestriction

or use this in the header of your file/module {-# LANGUAGE NoMonomorphismRestriction #-}
