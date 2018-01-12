*! version 1.1, 12 January 2018
*! Doug Hemken

*  added rownames option
*  TO DO:
*  add column equation names option
*  allow a user-defined header
mata :
mata drop matrixmarkdown()
void function matrixmarkdown(string scalar matrixname, | real scalar inclrow) {
	A = st_matrix(matrixname)
	H = st_matrixcolstripe(matrixname)
	R = st_matrixrowstripe(matrixname)
//	R
	hasceq = any(H[.,1]:!="")
	hasreq = any(R[.,1]:!="")
//	if (hasreq) {
//		R[.,1],strofreal(R[.,1]:!="")
//		}
	
	printf("\n")
	//TABLE HEADER
	if (hasceq) {
		headereq = "| "
		if (inclrow != 0) {
			headereq = "|| "
			if (hasreq) {
				headereq = "||| "
			}
		}
		for(i=1;i<=rows(H);i++) {
			headereq = headereq + sprintf("%s |", H[i,1])
		}
		printf("%s\n", headereq)
		}
	if (!inclrow) {
		header = "| "
		}
	else {
		header = "| variable| "
		if (hasreq) {
			header = "| equation| variable| "
			}
		}
	for(i=1;i<=rows(H);i++) {
		header = header + sprintf("%s |", H[i,2])
		}
	printf("%s\n", header)
	//HEADER SEPERATOR
	if (!inclrow) {
		headsep = "|"
		}
	else {
		headsep = "|----|"
		if (hasreq) {
			headsep = "|----|----|"
			}
		}
	for(j=1;j<=cols(A);j++) {
		headsep = headsep + sprintf("%s", "----|")
		}
	printf("%s\n", headsep)
	//TABLE BODY
	for(i=1;i<=rows(A);i++) {
		if (inclrow != 0) {
			if (hasreq) {
				printf("| %s", R[i,1])
				}
			printf("| %s", R[i,2])
		}
	for(j=1;j<=cols(A);j++) {
		printf("| %s", strofreal(A[i,j]))
		}
		printf(" %s\n", "|")
		}
	}
	
mata mosave matrixmarkdown(), dir(PERSONAL) replace
end
