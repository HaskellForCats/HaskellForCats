
{----------------------------------------------- 
What you get 
    a Linux OS
    vim 
    git 
    Haskell -- a super strong and super-fast programming language that can build real stuff.
    

Why Haskell 
The short answer ... 
    Benchmark Game
      C, Java, Ruby, and Haskell
        Web FrameWork Shootout
          C, Java, Ruby, and Haskell
    Warp vs nginx

        TIOBE Index
        All the C 
 
    The Yale paper 
        Moore's Law 2005 
        Multi-Core World 


Learning Haskell will make you a good programmer, cause you aren't permitted to be sloppy. Crappy coders can't do Haskell, they get frustrated and stop. 

Plus you will be coding at the highest level, with a language that was ten years in development rather than a weekend as in the case of php, or a week as in the case of JavaScript. 

Other popular languages have issues to favs 
	Ruby and Python suffer from being inturpreted which was fine some light duty programming but as we saw there is substantive performance hit. 

C# is tied to MicroSoft so  unless you want to go MicroSoft all the way and pay and pay.

Java works but it has issues with spagehtti code, that is code that is hard to follow. Python and Ruby were answers but they were slow. 

C++ was worse in that capacity. 

C makes you  shoulder too much typing to get to larger scale and it's too close to the metal for all but the tightest of spaces. 

Go is a C rewrite that solves some concurrency issues but not others. 
	Go code that works on 8 cores won't work on 64. 
	Plus it too is really close to the metal. 

And then there is the issue of Dynamic typing which is so forgiving at the beginning but really exasperating at the middle and end stages of a project. The last 30% is where all the pain lives. 

If there is Dynamic Typing involved You best have TDD a.k.a. Test Driven Development, or you will be chasing down heisenbugs, heisenberg was the physicist that came up with uncertainty principle. In computer debugging world we don't want to chase bugs that only show up sometimes, without warning. You want to find them fast, and them consistant. 

A Developer I know was in tremendous pain, spending 80% of his time bug hunting null pointers. Which is what you they do TDD to prevent. 

Miss Match errors is a swarth of bugs that show up in JavaScript and Php because it is so forgiving, which sounds nice except for when you have to weird errors because it accepted a String where there sould have been a number. 

NonExclusivity Errors 
	are when the function you have written doesn't cover enough cases / conditions and as a result never terminate. 
	Again tests must be thought up and written to do cover those possibilities.  



Haskell doesn't have null pointers so you don't have to write tests for those. 

Having explored all the other choices, I have to say, Haskell was harder in someways, but was always thoughtfully worked out, as opposed to thrown to together. That thrown togetherness, to me always felt broken. 

--------------------------------------
Haskell is a purely functional programming language. 
In imperative languages you get things done by giving the computer a sequence of tasks and then it executes them. While executing them, it changes state; 

that is it writes and then writes over the same memory addresses over and over and over. On a small scale not a problem on a big scale it can be a disaster. Once upon a time it was the only way to get any work done.

Part of the problem was the success of Alan Turing's model of how to compute math on a machine. This was in the mid 1930's, Just before World War Two. And before the war was over, Turing would save Brittan from defeat by cracking the German's Enigma Code. 

How did his Country pay him back by prosecuting him for being gay, the punishment was so sever that he killed himself by eating a cyanide injected apple.

Turing's Turing machine is a hypothetical device that manipulates symbols on a strip of tape according to a table of rules. Despite its simplicity, a Turing machine can be adapted to simulate the logic of any computer algorithm, and is particularly useful in explaining the functions of a CPU. 

He is celibrated today and his model of computation is baked into most every programming language out there. Especially the C language, which direclty covers about 65% of programming, and if we chart all of C's influence it reaches about 95-98%. 

Haskell comes from that small percentage that doesn't follow C and Turing. 

Turning's Professor Alonzo Church, was also working on a model of computation, one that Turing thought was more eligant than his own, lambda calculus.    

Another super brilliant guy John McCarthy took Lambda Calc and teaked it into LISP,  As one of the earliest programming languages, Lisp pioneered many ideas in computer science, including tree data structures, automatic storage management, dynamic typing, conditionals, higher-order functions, recursion, and the self-hosting compiler. 


The name LISP derives from "LISt Processing". Linked lists are one of Lisp language's major data structures, and Lisp source code is itself made up of lists. As a result, Lisp programs can manipulate source code as a data structure, giving rise to the macro systems that allow programmers to create new syntax or even new domain-specific languages embedded in Lisp.


McCarthy showed that with a few simple operators and a notation for functions, one can build a Turing-complete language for algorithms.

LISP was a major breakthrough but it was to be eclipsed by another Language C. In 1972 after the A version and the B version didn't work, Denis Richie and Ken Thompson, produced the C programming language for the Unix operating system. 

Unix went viral, and C along with it. 

Apple's IOS, and Mac both use a C variant, called Objective C. C with objects became C++. Java tamed the wilder parts of C++, and then MicroSoft took Java and polished it all shiny and we get C# which is meant to be two plus signs on top of each other. ++ being the simple for the next increment in a number line. 

C-Engineering 
java C# are entiprise 
Haskell comes from Mathmatics 25-years
	There are precious few Chuckle-heads using it, 
		cause it's to hard for ChuckleHeads to get even if they want to. 
	careful long term dev
	Strong theory 
	IO took eight years to come to Haskell.
	Innovative
	It is now Industrial Strength
		Facebook
		Google use
	It has high grade libraries.

	the trade off it is so different it appears harder than it is.
		yes it is hard but even if you don't use it after 
		being exposed to it makes you a better programmer automatically. 

Tools 
	Haskell Platform 
		via Synaptic 

Terminal 
	Roxterm
	
	
	GHCI in the terminal 
		REPL
		let binding
	Text editting will be provided by by Vim
		Vim because it is EVERYWHERE!!! 
		even in places where there is nothing else
		Hardcore Dev use it. 
		Getting use to it means you have street cred. 
	


VIM and SourceCode
src -- in the terminal. 
	aka sourcefile
	no let needed for bindings. 
	:load 
	:reload
	:m 
	:set
	:set editor vim -N	
	
	
  
---------------------------------------------
ON/OFF & a cyanide apple      
Turing Machine Heads 
    Reading and Writing is Fundamental
Erase  
Jane how do stop this crazy thing?

50s Fortran - Algol - John McCarthy and LISP  
60s - 70s - 80s - 90s - 00s - Today and Tomorrow
TIOBE Index 
programing Languages Benchmark game. 

Why we owe everything to a guy you never heard of (Dennis R)
UNIX, BSD and LINUX and everything else. 
        C -> C++ -> Java -> C# 
       / \           \        \
    (Go) |           (Scala)   F#
         | 
         Obj-C & "what the @#$% was Jobs thinking?" just blame it all on Smalltalk    

Paul Graham, OOP and The SmallTalk Murder Mystery? 
Help my procedure is toooo complicated 
oops!
Abstraction hierarchy 
the right idea is worth 80 IQ points. 



1990 Haskell 1.0 
    A programming research version

1997 Haskell 98     
    the core of the language is consolidated 

Purely Function 
    functions are values 
    values are unchangeable 

Lazy 
    things don't get evaluated until needed.

Strict Static Typed 
    but feels dynamic 

So different it feels hard

C- Engineer
Java/C# - Biz C

Haskell - Math
    strong theoretical roots
        early in it's dev it couldn't even 
        print to the screen 
        rather than do the just make it work approach it like others 
            they came up with the monad.

Cutting edge
S.T.M.
Parallel
Cloud computing 

industrial strength 

10 to 50 times faster than python or ruby
about as fast as C# and Java without trying -- the programming language benchmark game

ghci

repl 

let 

haskell source file

loading files

add some numbers and ++ some strings 

functions 

Pure Functions 

recursions

pattern Matching 

lazyness 

-- comments 

Purity 

Pure-fuctions can't change touch or change state.

Pure-fuctions can't change depend on or be changed by state that can be modified. 

If you can tell a function ran without using a debugger it's isn't pure. 
        printing to a file or screen
        reading from a file or screen 
        getting the current time 
        random number generation  
            they all depend on state. 
note that using head and tail 
where we might encounter the empty 
list makes for crashy programs
use patterns instead. 

In patterns it's always a good idea to include the otherwise even if just to give a final error option. 

Case expressions have no guards

where works with a function definition
    top down 
let allows assignments outside function definition 
    bottom up 

always use spaces over tabs 

expressions over multiple lines must have indents 

watch let and where indents 






-}

