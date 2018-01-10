*! version 1.0, 10 January 2018
*! Doug Hemken

*  add rownames option
*  add equation names option
mata :
void function matrixmarkdown(string scalar matrixname) {
	A = st_matrix(matrixname)
	
	H = st_matrixcolstripe(matrixname)
	
	printf("\n")
	header = "| "
	for(i=1;i<=rows(H);i++) {
		header = header + sprintf("%s |", H[i,2])
		}
		printf("%s\n", header)
	
	headsep = "| "
	for(j=1;j<=cols(A);j++) {
		headsep = headsep + sprintf("%s", "----|")
		}
		printf("%s\n", headsep)
	for(i=1;i<=rows(A);i++) {
	for(j=1;j<=cols(A);j++) {
		printf("| %s", strofreal(A[i,j]))
		}
		printf(" %s\n", "|")
		}
	}
	
mata mosave matrixmarkdown(), dir(PERSONAL) replace
end
