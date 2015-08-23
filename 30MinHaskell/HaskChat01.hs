module HaskChat where 
import Network.Socket 
import System.IO 
import Control.Concurrent 
import Control.Concurrent.Chan
import Control.Monad
import Control.Monad.Fix (fix)
import Control.Exception


type Msg = (Int,String) 

main = do 
        chan <- newChan 
        sock <- socket AF_INET Stream 0 
        setSocketOption sock ReuseAddr 1 
        bindSocket sock (SockAddrInet 4242 iNADDR_ANY)
        -- que numbers 
        listen sock 5 
        forkIO $ fix $ \loop -> do 
                (_, msg) <- readChan chan 
                loop 
        mainLoop sock chan 0 

mainLoop sock chan nr = do 
        conn <- accept sock 
        forkIO (runConn conn chan nr)
        mainLoop sock chan $! nr+1 

runConn (sock, _) chan nr = do 
        let broadcast msg = writeChan chan (nr,msg)
        hdl <- socketToHandle sock ReadWriteMode 
        hSetBuffering hdl NoBuffering 
        hPutStrLn hdl "Hi How Are YOU ?"
        name <- liftM init (hGetLine hdl)
        broadcast ("--> " ++ name ++ " entered,")
        chan' <- dupChan chan 
        reader <- forkIO $ fix $ \loop ->  do 
                        (nr', line) <- readChan chan' 
                        when (nr /= nr') $ hPutStrLn hdl line 
                        loop 
        handle (\(SomeException _ ) -> return ()) $ fix $ \loop -> do 
            line <- liftM init (hGetLine hdl)
            case line of 
             "quit" -> hPutStrLn hdl "Bye!"
             _ -> do 
                    broadcast (name ++ ": " ++ line)
                    loop 
        killThread reader 
        broadcast ("<-- " ++ name ++ " left.")
        hClose hdl 
