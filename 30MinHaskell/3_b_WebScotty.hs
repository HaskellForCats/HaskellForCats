{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Monoid (mconcat)

-- main :: IO () 
main = scotty 3000 $  
        get "/" $     
        html $ mconcat ["<html><body>" 
                       ,"<h1> Heading </h1>"
                       ,"</body></html>"
                       ] 
                   
