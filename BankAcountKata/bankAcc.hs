module BankAcc where 
import Test.HUnit
import Test.Hspec
{-
test1 = TestCase (assertEqual "for (foo 3)," (1,2) (foo 3))
   test2 = TestCase (do (x,y) <- partA 3
                        assertEqual "for the first result of partA," 5 x
                        b <- partB y
                        assertBool ("(partB " ++ show y ++ ") failed") b) 
-}



-- initialBalanceValue :: Num a => a -> a

initialBalanceValue = 0 
initialBalanceAccoutValue x = initialBalanceValue:[] 
-- statementLine x y z  =  (x,y,z)
-- assert opening balance of account "DateNow,0,0"
printStatement  = 
main :: IO ()
main = hspec $ do
  describe "BankAccount" $ do
    it "prints statement with 0 balance when created" $ do
      printStatement(createBankAccount()) `shouldBe` "9/22/15\t0\t0"


