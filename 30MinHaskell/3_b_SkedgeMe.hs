{- 
SkedgeMe  
API into Sephora Website 
41-K.L.O.C. 
Major Intractable Bugs 
Timezones 
Recurring Events 
Notifications 
***Double-Bookings 
No Doc 
** Bad Performance
    interactive-es 60 sec load time  
Inflexible 
No Client Based Solutions 
    Netscape approach 
        rewrite it? 
Monads 
   help with abstracting software into layers.
    Starting at the IO layer 
        
IO layer, the usual IO, State-full, messy, imperative like IO actions which are hard to reason about. 
A raw DB layer 
SQL interface this makes for strict ACID guarantees between transactions
No Side Effects -- during transactions 
--so no email confirmations sent because what if a transaction needs to be rolled back, you can't call back the email. 
Optimistic locking at the DB layer, to support Auto Retries but you don't want to be sending emails for tries, only successes. 
This Raw-DB layer gives concurrent guarantees in our cluster.
A Second Monad, a DB-monad over the Raw SQL, an IO ref, can use any Haskell Algebraic Data Types you want to use. & CRUD caching validation  

A Security Monad -- who is performing the action -- it makes sure that the person is legally allowed to perform the given transaction.   
   
Business layer -- so as not to double book, staff booked close to a local office.  
    so each piece of business logic cuts through the stack to a certain level.
    Time is coupled to a spacial index and is written at the raw-DB layer, otherwise where possible we abstract up. 

General-Purpose 
  Appointments    Biz <-M-M-M-M-> Raw-DB
  people          Biz <-M-M-M-M-> Raw-DB
  Notification    Biz <-M-M-M-M-M-> IO 
  -               Biz <-M-M-M-M-M-> IO 
Client Specific 
  Buy-and-Large   Biz <-M-M-M-M-> Raw-DB
  AcmeU           Biz <-M-M-M-> DB
  -               Biz <-M-M-M-M-> Raw-DB 


Roles by Client 
	Basic Onwer Staff Customer 
	But NLarge LeaderShip District Manager Store Manager Sales Associate, Customer 
	AcmeU Admin Faculty Staff Teaching Assistant Student 


Security -- clients had predefined security roles which would then require custom security policies. 
	-- didn't want to have to and numerous checks through-out the code base.
	-- OOP inheritence with a top down down granular leveling 
	-- But with us each component had it's own set of verbs 
	-- Each customer specific component had it's own verbs associated with it.
	-- a straight down inheritence heirarchy wouldn't work well . 
	-- Multi parameter Type Class with Double dispatch with role and Verb type 
	-- One type for each role schema one for defualt one for each custom-client 
	-- and a type for each component within the system. 
	-- using Bools for True and exceptions for false 
	-- Haskell will check that what we are using and where 
	-- You don't have to write instances of policy  
  -- We get everything statically checked by the compiler 
  -- We know when we have saticfied all the conditions 
  -- We don't have rounds of tests 
  -- we don't have rounds of back and forth with the client 
  -- We do have a list of compiler errors 
  -- We map the general onto the specific and where general suffices we use that where speceficity is require we impliment it just where needed. 
  -- All Statically checked 
  -- all easy to read which is vital for security code 	
	
	-- Security --

														General-Purpose													Client-Specific 
									Appointments 		People 		Notification	-		BuyAndLarge 	AcmeU      -
	Standard        -X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X         
  Buy-and-Large   -X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X      x-x-x-x-x-x
  AcmeU           -X-X-X-X-X-X-X-X-X-X-X                                    x-x-x-x
  -                                                                                    x-x-x
 
the updated schema might look like this 

 
														General-Purpose													Client-Specific 
									Appointments 		People 		Notification	-		BuyAndLarge 	AcmeU      -
	Standard        -X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X-X         
  Buy-and-Large                                               x-x-x-x-x-x
  AcmeU                           -X-X-X                                    x-x-x-x
  -                                                                                    x-x-x

Quick and Dirty Importer 
1400 lines just additions 
lots of partials
one has 24 parameters 
limited inputs 
we leaned on the typesystem so heavily that in any other language it would have crashed 
9 JS libs -- 
Haskell 71 lib 87 deps --  one down for bugs 
less but better	
library hunting and gem shopping 

Cyclic Dependancies 
	GHC 

Scalable beyond 4 cores was not so good 

idle garbage collection ate into performance so we turned it off. 
Haskell doesn't give you stack traces
	but profiling in live 

10 months 
42 K.L.O.C. Groovy Java ----> 8200 Haskell lines 
No persistant Bugs
	cause when they show we can effectively kill them 
	we don't spend that much time on bugs  
Great performance and Flexability
	4 cores Haskell == 64 Cores Groovy Java  
Used daily by thousands 
Half the Client base has migrated 
Testing ---> QuickCheck early on 
QA people find learning Haskell easier than other teting stratagies 

-}

