module UnCatExp14 where 
books = 	[
			 28.19,
			 15.02,
			 13.77,
			 6.52,
			 4.87,
			 4.31,
			 3.27,
			 3.26,
			 3.26,
			 3.22
		]
-- *UnCatExp14> sum books
-- 85.69000000000001
-----------------------------
compEquip =	[ 	
			292.76,	
			 31.57,
			 97.98
		]

-- *UnCatExp14> sum compEquip
-- 422.31
-------------------------------
eduSoft = 	[
		25.00,
		 25.00,
		 25.00,
		 25.00,
		 25.00,
		 25.00,
		 46.81,
		 34.84,
		 21.76,
		 21.76,
		 21.76,
		 21.76,
		 21.76,
		 21.76,
		 29.00,
		 29.00,
		 29.00,
		 29.00,
		 29.00,
		 31.19,
		 17.27,
		 0.99,
		 10.00,
		 32.64,
		 6.38,
		 5.00,
		 5.00,
		 4.94,
		 3.33,
		 80.00
		]
-- *UnCatExp14> sum eduSoft
-- 703.95
---------------------------

entertain = [ 		
			8.00,
			 6.21,
			 6.04,
			 5.72,
			 5.39,
			 4.35,
			 2.99,
			 8.49,
			 5.99,
			 3.50,
			 3.50,
			 9.00,
			 9.00,
			 9.00,
			 9.75,
			 9.00,
			 9.75,
			 9.50,
			 11.97,
			 11.97,
			 11.97
		]
-- *UnCatExp14> sum entertain
-- 161.09
-------------------------------
events = [
			 6.00,
			 10.00,
			 10.00,
			 5.00,
			 5.00,
			 10.87,
			 30.00
	]
-- *UnCatExp14> sum events
-- 76.87
---------------------------------------
iphone = [
		 231.65,
		 60.39,
		 500.79
	]
-- *UnCatExp14> sum iphone
-- 792.83

-------------------------------
mtaTrans = 		[		 
					10.00,
					 10.00,
					 10.00,
					 19.05,
					 10.00,
					 10.00,
					 20.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 30.00,
					 30.00,
					 30.00,
					 20.00,
					 19.05,
					 19.05,
					 18.50,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 19.05,
					 10.00,
					 10.00,
					 30.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 19.05,
					 19.05,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 20.00,
					 10.00,
					 19.05,
					 19.05,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00,
					 10.00
				]
-- *ExpUnCat14> sum mtaTrans
-- 		920.8999999999999
------------------------------------------------
meetUpMon =	[
		45.00,
		45.00,
		45.00,
		19.00,
		19.00,
		19.00,
		19.00
		]
-- *UnCatExp14> sum meetUpMon
-- 211.0
-------------------------------------------------

office =[
		 6.53,
		 21.76,
		 1.89,
		 4.30,
		 1.36
		]
-- *UnCatExp14> sum office
-- 35.84
-------------------------------------------------

softWare = 	[
		10.00,
		 5.00,
		 5.00,
		 5.00,
		 5.00,
		 5.00,
		 5.00,
		 5.00,
		 79.99,
		 79.00,
		 107.79,
		 32.65,
		 21.76,
		 10.88,
		 7.61,
		 1.08,
		 1.08,
		 14.12,
		 3.26,
		 2.17,
		 2.16,
		 1.08,
		 1.08,
		 1.08,
		 1.08,
		 1.08,
		 0.99,
		 7.00,
		 7.00,
		 7.00,
		 7.00,
		 7.00,
		 7.00,
		 7.00,
		 7.00,
		 7.00
		]
-- *UnCatExp14> sum softWare
-- 477.93999999999994
-------------------------------
tranpTaxi = [ 	7.70,
		 8.30,
		 10.10,
		 10.70,
		 7.20,
		 7.20,
		 10.20,
		 13.20,
		 39.00
	]
-- *UnCatExp14> sum tranpTaxi
-- 113.60000000000001

exp2014 = [books, compEquip, entertain,events,eduSoft,iphone,meetUpMon, mtaTrans, office,softWare,tranpTaxi] 
expT2014 = (sum [sum x|x<-exp2014])
-- *UnCatExp14> expT2014
-- 4002.0200000000004
----------------------------------------
-- not included -------
amDemand = [ 
		 3.99,
		 3.99,
		 3.99,
		 3.99,
		 3.99,
		 3.99,
		 3.99,
		 2.99,
		 2.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99,
		 1.99
		]
-- *UnCatExp14> sum amDemand
-- 207.04000000000025
