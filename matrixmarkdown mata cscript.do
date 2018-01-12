cscript
sysuse auto

regress mpg price weight i.foreign

mata:  matrixmarkdown("e(b)")
mata:  matrixmarkdown("e(V)")

matrix B = 1,2\3,4
mata: matrixmarkdown("B") // includes rowstripe by default
mata: matrixmarkdown("B", 0) // suppress rowstripe

tabstat price-gear_ratio, statistics(count mean sd min max) columns(statistic) save
matrix A = r(StatTotal)'
mata: matrixmarkdown("A")

quietly sem (price <- mpg)(mpg <- weight)
matrix SEM = e(b)'
mata: matrixmarkdown("SEM")
mata: matrixmarkdown("SEM", 0) // no rowstripe

matrix SEMV = e(V)
mata: matrixmarkdown("SEMV")
mata: matrixmarkdown("SEMV", 0)
