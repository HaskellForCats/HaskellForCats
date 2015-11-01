{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
-- {-# LANGUAGE OverloadedStrings, QuasiQuotes, TemplateHaskell, TypeFamilies #-} 
-- -ddump-splices
--import Blaze.ByteString.Builder           (Builder, fromByteString)
--import Network.HTTP.Types                 (status200) 
--import Network.Wai                        (Application, responseBuilder)
--import Network.Wai.Handler.Warp           (run)
--import Text.Blaze.Html.Renderer.Utf8      (renderHtmlBuilder)

--import Text.Blaze.Html5                   (Html, docTypeHtml)
import Yesod 

data HelloWorld = HelloWorld 

mkYesod "HelloWorld" [parseRoutes| 
/ HomeR GET 
|]

instance  Yesod HelloWorld 

getHomeR :: Handler Html 
getHomeR = defaultLayout [whamlet|Hello, World!|]

main :: IO () 
main = warp 3000 HelloWorld 
