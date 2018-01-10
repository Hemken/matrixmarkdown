cscript
sysuse auto

collapse (count) obs=price (mean) mean=price ///
	(sd) sd=price (min) min=price (max) max=price

mata:  datamarkdown(.,.)
mata:  datamarkdown(.,2)
mata:  datamarkdown(.,2..4)
mata:  datamarkdown(.,"mean")
mata:  datamarkdown(.,("mean", "sd"))

mata:  datamarkdown(1,.)
mata:  datamarkdown(1,2)
mata:  datamarkdown(1,2..4)
mata:  datamarkdown(1,"mean")
mata:  datamarkdown(1,("mean", "sd"))

capture mata:  datamarkdown(2,.)
assert _rc == 3300
capture mata:  datamarkdown(1,6)
assert _rc == 3300
capture mata:  datamarkdown(1,"xxx")
assert _rc == 3598

clear
sysuse auto
mata: datamarkdown(.,.)
mata: datamarkdown(1,.)     // obs 1
mata: datamarkdown(1,2)
mata: datamarkdown(1,2..4)
mata: datamarkdown(1,"price mpg")
mata: datamarkdown(1,("price", "mpg"))
mata: datamarkdown(1\5,2..4)   // obs 1 and 5
mata: datamarkdown((1,5),2..4) // obs 1 thru 5
mata: datamarkdown((1,3\7,9),"price mpg")

mata: datamarkdown(.,"price mpg foreign", "foreign")
