module Main where

import Control.Monad (when, unless)
import System.IO (openTempFile, hPutStr, hFlush, hClose)
import System.Directory (getTemporaryDirectory, doesFileExist)
import Data.Char
import Data.List (isPrefixOf)
import Data.Maybe (isJust)
import Language.Haskell.Interpreter  -- from hint package
import Text.Regex                    -- from regex-compat-tdfa package
