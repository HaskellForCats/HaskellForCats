module Hed where


type FileState = ([String], [String])

fromFile :: FilePath -> IO FileState
fromFile filename = do
    contents <- readFile filename
    return $ ([], lines contents)

writeState :: FilePath -> FileState -> IO ()
writeState filename (before, after) = do
    writeFile filename (unlines (reverse before ++ after))

downLine :: FileState -> FileState
downLine (xs, []) = (xs, [])
downLine (xs, (y : ys)) = ((y : xs), ys)

upLine :: FileState -> FileState
upLine ([], ys) = ([], ys)
upLine (x:xs, ys) = (xs, x:ys)

data HedState =
    Unopened
    | Opened FilePath FileState
    | Modified FilePath FileState
    | Exited


runCommand :: String -> HedState -> IO HedState
runCommand "" state = return state
runCommand (c : line) state = undefined

runLoop :: HedState -> IO HedState
runLoop state = do
    putStr "> "
    -- Need flush here?
    command <- getLine
    newState <- runCommand command state
    case newState of
        Exited -> return newState
        _ -> runLoop newState

main :: IO ()
main = do
    runLoop Unopened
    return ()
{-------------------------------------------
HED editor as a project in Haskell 

ed-like editor.   
line-oriented editor, 
don't need any fancy UI code.  
I/O - functions you need to know are: 
	getLine, 
	putStrLn, 
	readFile, and 
	writeFile. 
 
enough IO monad work to introduce IO monad 
+ do-notation,
 
NOTE!: it's better than REST server- handling HTTP connections and parsing JSON objects is inherently complex, which means you have lots of API complexity to handwave around.

readFile and writeFile allow you talk about lazy evaluation,  
All of the rest of the code is stuff Haskell excels at- data structure manipulation.  
Being able to separate out the data structure manipulation 
	from the I/O allows you to unit test stuff, 
	and introduce quickcheck.  

You could even dabble with parallelism by implementing a global search and replace, and then parallelizing it.  

-------------------------------------
-- global-search -- ???
character manipulation...
reverse -- a -> a 
lines -- String -> lists 
unlines -- lists -> String
pattern matching 
monadic 
do notation 
lazy eval buffering under the hood
case statement  
-- variant types -- descriminated unions -- algebraic 
-------------------------------------
prelim  
-- 128 Java --> 4 cores Haskell
	-- per 2 virtual cores -- 0.46 
*Hed> (128 /2)*0.46
29.44
*Hed> (4 /2)*0.46
0.92

hourYears = 8765.81
-- 1.120 per hour 16 cores 
*Hed> hourYears * 8 * 1.12
78541.6576
*Hed> hourYears * 0.280
2454.4268


-- Turing v. Lambda Calc. -- the dawn of computing 
-- a as in undefined -- a mock -- error handling. 
-- good IDE == Primative Language 
-- lists and tuples 
-- list comprehension
-- type system -- 20 min 
	Int 
	Integer
	Float 
	types as shapes 
	
-- white space 
-- guards 
-- benchmaks mandle board
-- scaling across multiple yale paper 
-- Four Horsemen and the Multicore Universe  
-- Full Time Idiots
-- compiler error catching 
-- null pointers --  


------------------------------------}
