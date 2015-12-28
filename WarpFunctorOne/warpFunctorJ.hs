{-# LANGUAGE ExtendedDefaultRules  #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies #-}
-- /Users/evxyz/Library/Haskell/bin/yesod
import Yesod 

data App = App 

mkYesod "App" [parseRoutes| 
/ HomeR GET 
|]
 
instance  Yesod App  

getHomeR = return $ object ["msg" .= "Hello, JsonWorld"]

main = warp 3000 App 

