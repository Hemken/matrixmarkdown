*! version 1.0, 10 January 2018
*! Doug Hemken

* variable labels as headers
* user-defined headers
* string data, st_sdata()

mata :
void function datamarkdown(real matrix obs, rowvector vars, | scalar select) {
	A = st_data(obs, vars, select)
	
	if (isstring(vars)) {
		if (length(vars)==1) vars = tokens(vars)
		vars = st_varindex(vars)
	}
	if (cols(vars)==1 &	missing(vars)==1) vars = 1..st_nvar()
	H = st_varname(vars)
	
	printf("\n")
	header = "| "
	for(j=1;j<=cols(H);j++) {
		header = header + sprintf("%s |", H[1,j])
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
	
mata mosave datamarkdown(), dir(PERSONAL) replace
end
