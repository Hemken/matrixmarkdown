clear
sysuse auto

local statlist = "count mean sd min max"
local i = 0
//local varl = ""
local clist = ""
foreach var of varlist * {
	capture confirm numeric variable `var'
//display "_rc= " _rc
	if (_rc==0) {
		//local varl = "`varl' `var'"
		local i = `i' + 1
		local j = 0
		foreach stat of local statlist {
			local j = `j' + 1
			local k = (`i'-1)*5 + `j'
//display "`i' `var' `j'"
			local v`k' = "(`stat') `stat'`var' = `var'"
//display "v`k' `v`k''"
			local clist = "`clist' `v`k''"
		}
	}
}

//display "`clist'"
collapse `clist'

quietly generate x = 1
reshape long `statlist', i(x) j(variable) string
quietly drop x

mata: datamarkdown(.,2..6,.,"variable")
