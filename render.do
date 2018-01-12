cd "z:/stata/matrixmarkdown"

dyndoc "matrixmarkdown example.smd", replace

set linesize 120
dyndoc "matrixmarkdown rowstripes.smd", replace
set linesize 79

dyndoc "doubleheader.smd", replace
