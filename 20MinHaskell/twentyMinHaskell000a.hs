module TwntyMin000a where 
-- : set expandtab ts=4 ruler number spell linebreak
-- : retab 

{- from SmallTalk-80 by Goldberg and Robson circa 1983 

A CLASS describes the implementation of a set of OBJECTS that all represent the same kind of system component. 

The individual objects described by a CLASS are called its instances.

An object's public properties are the messages that make up its interface.

An object's private properties are a set of INSTANCE VARIABLES that make up its PRIVATE memory and a set of METHODS that describe how to carry out its operations.

A MESSAGE is a request for an object to carry out one of its operations.

A MESSAGE specifies which operation is desired, but not how that operation should be carried out. The RECEIVER, the object to which the message was sent, determines how to carry out the requested operation.

The set of messages to which an object can respond is called its INTERFACE with the rest of the system. The only way to interact with an object is through its INTERFACE.

A crucial property of an OBJECT is that its PRIVATE memory can be manipulated only by its own operations. 
A crucial property of MESSAGEs is that they are the only way to invoke an object's operations.  

An object cannot depend on the internal details of other objects, only on the messages to which they respond.


MESSAGES insure the modularity of the system because they specify the type of operation desired, but not how that operation should be ac- complished. 
----------------------------------------

Compare that with the functional approach:

function + argument(s) 
    is the basic structure
    and
    (functions + arguments) can be passed in their entirety 
        to other functions as arguments. 
In Haskell same inputs yeild same outputs always. 

    Haskell's types provides the interface
        but that interface isn't voluntary
        It can't be subverted by casting or or wrapping
            All types must be known at runtime
                otherwise no compiling.
Haskell types are not interfaces, because those are confined to objects locally. All types are system wide. 
        runs throughout the entire language
            not just through the one object it was written for.
         
    Functions provide complete encapsulation
        of their internals. 
        Modularity is baked in. 
        Distinctions of public and private evaporate.
    You can't construct leaky objects  
       
think of rail traffic verses road traffic. Think of the number of train wrecks verses the number of truck wrecks
    train fatalities verses road fatalities. 
    most drivers think they are above average in their abilities
    as do most programmers 
    and both are wrong.



