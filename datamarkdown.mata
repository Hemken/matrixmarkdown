*! version 1.1, 11 January 2018
*! Doug Hemken

* row names enabled
**** to do ???
* variable labels as headers
* user-defined headers
* string data, st_sdata()

mata :
void function datamarkdown(real matrix obs, rowvector vars, ///
		| scalar select, rowvector rnames) {
	A = st_data(obs, vars, select)
	R = st_sdata(obs, rnames, select)
//cols(R)
//R
// missing values if the input variables are numeric
	
	if (isstring(vars)) {
		if (length(vars)==1) vars = tokens(vars)
		vars = st_varindex(vars)
	}
	if (cols(vars)==1 &	missing(vars)==1) vars = 1..st_nvar()
	H = st_varname(vars)
	
	if (cols(R)>0) {
		if (isstring(rnames)) {
			if (length(rnames)==1) rnames = tokens(rnames)
			rnames = st_varindex(rnames)
		}
		RH = st_varname(rnames)
	}
	
	printf("\n")
	//TABLE HEADER
	header = "| "
	if (cols(R)>0) {
	  for(j=1;j<=cols(R);j++) {
		header = header + sprintf("%s |", RH[1,j])
		}
	}
	for(j=1;j<=cols(H);j++) {
		header = header + sprintf("%s |", H[1,j])
		}
		printf("%s\n", header)
	//HEADER SEPERATOR
	headsep = "| "
	if (cols(R)>0) {
	  for(j=1;j<=cols(R);j++) {
		headsep = headsep + sprintf("%s", "----|")
		}
	}
	for(j=1;j<=cols(A);j++) {
		headsep = headsep + sprintf("%s", "----|")
		}
		printf("%s\n", headsep)
	//TABLE BODY
	for(i=1;i<=rows(A);i++) {
	if (cols(R)>0) {
	  for(j=1;j<=cols(R);j++) {
//isstring(R[i,j])
		//if (isstring(R[i,j])) {
			printf("| %s", R[i,j])
			//} 
			//else {
			//printf("| %s", strofreal(R[i,j]))
		}
	}
	for(j=1;j<=cols(A);j++) {
		printf("| %s", strofreal(A[i,j]))
		}
		printf(" %s\n", "|")
		}
	}
	
mata mosave datamarkdown(), dir(PERSONAL) replace
end
