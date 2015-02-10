module Dec02 (  
	 dec02  
			)where  
  
{-  
xs  = [          2014-11-11 , $19.05 , MTA MVM*CANAL ST & QPS NEW YORK      NY , 2 ,  
		 2014-11-11 , $3.99 , Amazon Services-Kindle 866-321-8851  WA , 2 ,  
		 2014-11-11 , $29.00 , PLURALSIGHT LLC        HINGHAM       MA , 2 ,  
		 2014-11-14 , $19.05 , MTA MVM*14TH STREETQPS NEW YORK      NY , 2 ,  
		 2014-11-15 , $34.84 , Safari Books Online    7078274118    MA , 2 ,  
		 2014-11-16 , $8.13 , Amazon.com             AMZN.COM/BILL WA , 2 ,  
		 2014-11-17 , $231.65 , VERIZON*ONETIMEPAY     800-VERIZON   TX , 2 ,  
		 2014-11-24 , $7.00 , GH *GITHUB.COM    WOHA 4157354488    CA , 2 ,  
		 2014-11-26 , $6.00 , BATTERY PARK CITY G    NEW YORK      NY , 2 ,  
		 2014-11-27 , $18.00 , LIRRNYTICKETS      QPS JAMAICA       NY , 2 ,  
		 2014-11-27 , $19.05 , MTA MVM*34TH STREETQPS NEW YORK      NY , 2 ,  
		 2014-12-02 , $1.08 , APL* ITUNES.COM/BILL   866-712-7753  CA , 2 ,  
		 2014-12-02 , $19.05 , MTA MVM*CHAMBERS STQPS NEW YORK      NY , 2 ]  -}

dec02 = sum [ 19.05 ,	  
         3.99 ,   
         29.00 ,  
         19.05 ,  
         34.84 ,  
         8.13 ,   
         231.65,
         7.00 ,   
         6.00 ,   
         18.00 ,  
         19.05 ,  
         1.08 ,   
         19.05 ]


--  [x|x <-[xs|xs <- (zip [0..] xs)]]  
