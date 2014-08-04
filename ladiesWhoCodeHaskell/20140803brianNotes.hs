

type State s a = s -> (s, a)

instance Monad (State s) where
    -- return :: a -> State s a
    -- return :: a -> (s -> (s, a))
    return x = \s -> (s, x)
    -- (>>=) :: State s a -> (a -> State s b) -> State s b
    -- (>>=) :: (s -> (s, a)) -> (a -> (b -> (s, b))) -> (b -> (s, b))
    x >> f = \s -> let (s', x') = x s in f x' s'

runState :: State s a -> s -> (s, a)
runState = id

readState :: State s s
readState = (\s -> (s, s))

writeState :: s -> State s ()
writeState s = (\_ -> (s, ()))

-- type IO a = State World a



-- where they come from Category Theory 
-- implementation (>>=) 
-- use of them  a.k.a. do notation which is Syntactically sweeter for many
-- their meaning a.k.a. how to think about them. 
    -- meaning code executing in a special context which is independent of all other 
        -- IO Monad is thus distinct from the STM Monad they have separate contexts. 
-- testing is easier because I can code independent of context and then introducing context later without having to redo shit. 
-- And it makes parallelization easier because we don't have to sync contexts, there is the purity and laziness helping for free. A big win considering how complex this stuff can get really fast.
-- 
-- a reason for why Haskell is getting attention now.   

