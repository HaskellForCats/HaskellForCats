module  EstTax4Qrt where
-- imported Data as module
import Dec02 
import Dec26 
import Nov09 
import Oct07 
import Sept07 

-- constants for EstTax
nycOglig        = 0.03534
albanyOblig     = 0.059
fedObligat      = 0.3 

-- imported expenses into a list 
expen = [dec02,dec26,nov09,oct07,sept07]

-- totaling the list
sumExpen = sum expen 
---------------------------------------------
-- totaling earned and subtracting expenses
earned4Qt = (sum [earnedSep,earnedOct,earnedNov,earnedDec,prevQt]) - sumExpen
                where  
                earnedSep = 0 
                earnedOct = 9000
                earnedNov = 0 
                earnedDec = 0 
                prevQt= (0 + prev)
                        where  
                        prev = 0  -- anything not otherwise included above

---------------------------------
-- formulary for arriving at the Fed, State, and local plus the total quaterly
taxFed = earned4Qt * fedObligat
taxAlbany = ( earned4Qt*albanyOblig)
taxNYC = ( earned4Qt*nycOglig)
taxTotalObligado = sum[taxFed, taxAlbany, taxNYC] 
---------------------------------

------- result -----------------
{- 
*EstTax4Qrt> taxFed
2028.474
*EstTax4Qrt> taxAlbany
398.93321999999995
*EstTax4Qrt> taxNYC
238.95423720000002
*EstTax4Qrt> taxTotalObligado
2666.3614572
-}


