***********************************************************
*Creates Table 7: Falsification Exercise and Reduced Forms: OLS Regressions
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\Lifeexpectancy_Acemoglu
log using maketable7, replace

/*Data Files Used
	changes0040
	changes4080
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use changes0040, clear

* col 1
reg dlife dmort, r

* col 2
reg dlife dmort if startrich!=1, r

* col 3
reg dpop dmort, r

* col 4
reg dpop dmort if startrich!=1, r

* col 5
reg dgdp dmort, r

* col 6
reg dgdp dmort if startrich!=1, r

* col 7
reg dgdppc dmort, r

* col 8
reg dgdppc dmort if startrich!=1, r



use changes4080, clear


* col 1
reg dlife dmort, r

* col 2
reg dlife dmort if startrich!=1, r

* col 3
reg dpop dmort, r

* col 4
reg dpop dmort if startrich!=1, r

* col 5
reg dgdp dmort, r

* col 6
reg dgdp dmort if startrich!=1, r

* col 7
reg dgdppc dmort, r

* col 8
reg dgdppc dmort if startrich!=1, r



