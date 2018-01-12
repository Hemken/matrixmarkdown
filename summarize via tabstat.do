sysuse auto
tabstat price-gear_ratio, statistics(count mean sd min max) columns(statistic) save
matrix A = r(StatTotal)'
mata: matrixmarkdown("A")
