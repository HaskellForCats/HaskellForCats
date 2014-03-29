-- Peano numbers
data Nat = Succ Nat | Zero
  deriving (Show)

inf :: Nat
inf = Succ inf

-- very similar in structure to List append.
add           :: Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (m `add` n)

-- comparing with List append (++).

data List a = Empty | Cons a (List a)
  deriving (Show)

listAppend               :: List a -> List a -> List a
listAppend Empty       ys = ys
listAppend (Cons x xs) ys = Cons x (xs `listAppend` ys)

listFoldr :: (a -> b -> b) -> b -> List a -> b
listFoldr consF emptyF xs = blah xs
  where
    blah Empty       = emptyF
    blah (Cons x xs) = consF x (blah xs)

listAppend' :: List a -> List a -> List a
listAppend' xs ys = listFoldr f ys xs
  where f value acc = value `Cons` acc

nat2int         :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

natFoldr                :: (Nat -> b -> b) -> b -> Nat -> b
natFoldr f init Zero     = init
natFoldr f init (Succ n) = f n (natFoldr f init n)

nat2int' :: Nat -> Int
nat2int' = natFoldr (const (+ 1)) 0

add' :: Nat -> Nat -> Nat
add' a b = natFoldr (const Succ) b a

int2nat  :: Int -> Nat
int2nat 0 = Zero
-- the n+k pattern looks elegant here (comparing with nat2int).
--int2nat (n+1) = Succ (int2nat n)
int2nat n = Succ (int2nat (n - 1))

intFoldr                :: (Int -> b -> b) -> b -> Int -> b
intFoldr f init 0        = init
intFoldr f init n = (f n (intFoldr f init (n - 1)))

int2nat' :: Int -> Nat
int2nat' = intFoldr (const Succ) Zero

-- Expressions

data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr

e :: Expr
e = Add (Val 1) (Mul (Val 2) (Val 3))

size :: Expr -> Int
size (Val _) = 1
size (Add x y) = size x + size y
size (Mul x y) = size x + size y

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y

fold :: (Int -> a) -> (a -> a -> a) -> (a -> a -> a) -> Expr -> a
fold fVal fAdd fMul expr = blah expr
  where
    blah (Val n) = fVal n
    blah (Add x y) = fAdd (blah x) (blah y)
    blah (Mul x y) = fMul (blah x) (blah y)

eval' = fold id (+) (*)

--
-- Binary trees
--

data Tree = Leaf Int
          | Node Tree Int Tree
  deriving (Show)

egTree :: Tree
egTree = Node (Node (Leaf 1) 3 (Leaf 4))
              5
              (Node (Leaf 6) 7 (Leaf 9))

occurs :: Int -> Tree -> Bool
occurs m (Leaf n)     = m == n
occurs m (Node l n r) = m == n 
                     || occurs m l 
                     || occurs m r

flatten :: Tree -> [Int]
flatten (Leaf n)     = [n]
flatten (Node l n r) = flatten l ++ [n] ++ flatten r

-- if it's a search tree we can do the following:
occursSearchTree :: Int -> Tree -> Bool
occursSearchTree m (Leaf n)              = m == n
occursSearchTree m (Node l n r) | m == n = True
                                | m < n  = occurs m l
                                | m > n  = occurs m r

treeFold :: (Int -> b) -> (b -> Int -> b -> b) -> Tree -> b
treeFold leafF nodeF tree = blah tree
  where
    blah (Leaf n)            = leafF n
    blah (Node left n right) = nodeF (blah left) n (blah right)

occurs' :: Int -> Tree -> Bool
occurs' m = treeFold (== m) (\left n right -> (m == n) || left || right)

flatten' :: Tree -> [Int]
flatten' = treeFold (\n -> [n]) (\left n right -> left ++ [n] ++ right)

occursSearchTree' :: Int -> Tree -> Bool
occursSearchTree' m = treeFold (== m) (\left n right -> (m == n) || (m < n) && left || (m > n) && right)
