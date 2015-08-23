module HaskChat where 
import Network.Socket 
import System.IO 
import Control.Concurrent 
import Control.Concurrent.Chan
import Control.Monad
import Control.Monad.Fix (fix)


type Msg = String 

main = do 
	-- makes socket
	sock <- socket AF_INET Stream 0 
	-- make it reusable 
	setSocketOption sock ReuseAddr 1 
	-- listen on TCP port 4242 
	bindSocket sock (SockAddrInet 4242 iNADDR_ANY)
	-- allow two connections
	listen sock 2 
	-- channer 
	chan <- newChan
	mainLoop sock 
--	-- pass channel to Loop
--	mainLoop sock chan  
--mainLoop sock = do 
--	-- accept and handle a connection 
--	conn <- accept sock 
--	forkIO (runConn conn) 
--	mainLoop sock 
	
--runConn (sock,_) = do 
--	-- socket to Handle
--	hdl <- socketToHandle sock ReadWriteMode 
--	hSetBuffering hdl NoBuffering 
--	hPutStrLn hdl "Hi!"
--	hClose hdl  
--	send sock "Hi!\n"
--	sClose sock 

