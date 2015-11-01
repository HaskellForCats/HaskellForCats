module  EstTax3rdQrt where
-- imported Data as module


-- constants for EstTax
nycOglig        = 0.03534
albanyOblig     = 0.059
fedObligat      = 0.3 

-- imported expenses into a list 
expen = [lics,taxs,docs,materials]
            where 
            lics = x + y + z + t 
                    where 
                        x = 0.0 
                        y = 0 
                        z = 0
                        t = 0 

            taxs = 533.225
            docs = 29.39
            educ = x + y + z 
                where 
                    x = 1000
                    y = 0 
                    z = 0  
            materials = (offSup + device)
                    where 
                        offSup = x + y + z + t
                            where
                            x = 8.98
                            y = 2.40
                            z = 13.99 
                            t = 0 
                        device = x + y + z + t  
                            where 
                            x = 70.78
                            y = 409.99 
                            z = 19.99  
                            t = 666.00 

-- totaling the list
sumExpen = sum expen 
---------------------------------------------
-- totaling earned and subtracting expenses
earnedQt = (sum [earnedJun,earnedJul,earnedAug,prevQt]) - sumExpen
                where  
                earnedJun = 0 
                earnedJul = (1200 + (90 * 97))
                earnedAug = 0 
                prevQt= (0 + prev)
                        where  
                        prev = 0  -- anything not otherwise included above

---------------------------------
-- formulary for arriving at the Fed, State, and local plus the total quaterly
taxFed = earnedQt * fedObligat
taxAlbany = ( earnedQt*albanyOblig)
taxNYC = ( earnedQt*nycOglig)

taxTotalObligado = sum[taxFed, taxAlbany, taxNYC] 

---------------------------------

------- result -----------------
{- 
*EstTax3rdQrt> taxFed
624.3764999999997
*EstTax3rdQrt> taxAlbany
122.79404499999994
*EstTax3rdQrt> taxNYC
73.55155169999998
*EstTax3rdQrt> taxTotalObligado
820.7220966999997


-}

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


