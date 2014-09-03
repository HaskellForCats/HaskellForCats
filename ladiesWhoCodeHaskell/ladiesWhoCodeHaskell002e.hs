module 
{-
*LwchTwo> :t (+)
(+) :: Num a => a -> a -> a
*LwchTwo> let x = x+2
*LwchTwo> x
*** Exception: <<loop>>
*LwchTwo> let a = 2+a
*LwchTwo> a == x
*** Exception: <<loop>>
*LwchTwo> let double x =x+x
*LwchTwo> let double' a= a+a
*LwchTwo> double' == d
*LwchTwo> double' 2  == double 2
True
*LwchTwo> let double'' y = y*y
*LwchTwo> double' 2  == double'' 2
True
*LwchTwo> :i double'
double' :: Num a => a -> a 	-- Defined at <interactive>:23:5
*LwchTwo> :i double''
double'' :: Num a => a -> a 	-- Defined at <interactive>:26:5
*LwchTwo> double' 2.  == double'' 2

<interactive>:30:13: parse error on input ‘==’
*LwchTwo> double' 2.0  == double'' 2
True
*LwchTwo> double' 2.0  == double'' 4
False
*LwchTwo> double' 2.0  == double'' 4 / 2
False
*LwchTwo> double' 2.0  == double'' (4 / 2)
True
*LwchTwo> double' 2.0  == double'' (4 / 2.0)
True
*LwchTwo> double' 2.0  == double'' (4 / 'a')
-}

