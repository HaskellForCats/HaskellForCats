{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}
import           Web.Scotty
import           Control.Monad.Trans
import           Data.Time
import           Data.Text.Lazy         as LT
main :: IO ()
main = scotty 3000 $ do
    get "/" getHome
    get "/time" getTime
    get "/search" getSearch
getHome :: ActionM ()
getHome = html "<!DOCTYPE html> <html> <head> <title></title> </head> <body> <a><p><h1><center> Hello World!<center></h1></p></a><h2> <p>for a simple intro try:</h2></p><p><h3> http://learnyouahaskell.com/chapters</p></h3><style>h3{text-align: center;color: black;font-size:50px; position: relative; -webkit-animation-name: example; /* Chrome, Safari, Opera */ -webkit-animation-duration: 4s; /* Chrome, Safari, Opera */ -webkit-animation-iteration-count: infinite; /* Chrome, Safari, Opera */ animation-name: example; animation-duration: 4s; animation-iteration-count: infinite; } /* Chrome, Safari, Opera */ @-webkit-keyframes example { 0%   {background-color:red; left:0px; top:0px;} 25%  {background-color:yellow; left:200px; top:0px;} 50%  {background-color:blue; left:200px; top:200px;} 75%  {background-color:green; left:0px; top:200px;} 100% {background-color:red; left:0px; top:0px;} } /* Standard syntax */ @keyframes example { 0%   {background-color:red; left:0px; top:0px;} 25%  {background-color:yellow; left:200px; top:0px;} 50%  {background-color:blue; left:200px; top:200px;} 75%  {background-color:green; left:0px; top:200px;} 100% {background-color:red; left:0px; top:0px;} }</style> </body> </html>"
getTime :: ActionM ()
getTime = do
        t <- lift $ getCurrentTime
        html $ LT.pack $ show t
getSearch :: ActionM ()
getSearch = do
        contact <- (param "contactId") `rescue` (\x -> return "Not Found")
        company <- (param "companyId") `rescue` (\x -> return "Not Found")
        html $ LT.concat [ "<ul>"
                         , "<li>Contact ID: ", (contact::Text), "</li>"
                         , "<li>Company ID: ", (company::Text), "</li>"
                         , "</ul>"] 