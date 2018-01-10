cscript
sysuse auto

regress mpg price weight i.foreign

mata:  matrixmarkdown("e(b)")
mata:  matrixmarkdown("e(V)")
