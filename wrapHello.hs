{-# LANGUAGE OverloadedStrings, QuasiQuotes #-} 
-- ddump-splices
import Blaze.ByteString.Builder           (Builder, fromByteString)
import Network.HTTP.Types                 (status200) 
import Network.Wai                        (Application, responseBuilder)
import Network.Wai.Handler.Warp           (run)
import Text.Blaze.Html.Renderer.Utf8      (renderHtmlBuilder)
import Text.Blaze.Html5                   (Html, docTypeHtml)
import Text.Blaze.Html5                   as H 
main :: IO ()
main = run 3000 app 

app :: Application 
app _req sendResponse = sendResponse $ responseBuilder
                        status200
                        [("Content-Type", "text/plain")]
                         (renderHtmlBuilder myPage)
myPage :: Html 
myPage = docTypeHtml $ do 
    H.head $ do 
        H.title "Hi form blaze-html and warp" 
    H.body $ do 
        H.h1 "This is going to be fun!!!"
        
-- type Application = Request 
--                    -> (Response -> IO ResponseReceived)
--                    -> IO ResponseReceived

