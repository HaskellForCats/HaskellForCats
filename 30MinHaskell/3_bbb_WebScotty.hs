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
    -- get "/add/?/?" [getAddNum, getAddText]
    get "/search" getSearch

getHome :: ActionM ()
getHome = html "<h1>Hello World!</h1>"

getTime :: ActionM ()
getTime = do
        t <- lift $ getCurrentTime
        html $ LT.pack $ show t

-- getAddNum :: Integer -> Integer -> ActionM ()
-- getAddNum n1 n2 = html $ LT.pack $ show (n1 + n2)

-- getAddText (w1::Text) (w2::Text) = html $ LT.concat [w1, w2]

getSearch :: ActionM ()
getSearch = do
        contact <- (param "contactId") `rescue` (\x -> return "Not Found")
        company <- (param "companyId") `rescue` (\x -> return "Not Found")
        html $ LT.concat [ "<ul>"
                         , "<li>Contact ID: ", (contact::Text), "</li>"
                         , "<li>Company ID: ", (company::Text), "</li>"
                         , "</ul>"
                         ] 
