
type State s a = s -> (a, s)

instance Monad (State s) where
    return x = \s -> (x, s)
    m >>= f = \s -> let (t, s') = m s in f t s'

get :: State s s
get = \s -> (s, s)

put :: s -> State s ()
put x = \s -> ((), x)

