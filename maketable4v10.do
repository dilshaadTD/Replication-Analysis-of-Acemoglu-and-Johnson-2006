***********************************************************
*Creates Table 4: Effect of Interventions on Disease Mortality, Zeroth Stage: Panel Regressions 1930-60 Dependent Variable: Mortality per 100,000 from Disease i in Country j at Period t
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\lifeexpectancy_Acemoglu
log using maketable4, replace

/*Data Files Used
	disease_stacked
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_stacked, clear


*Panel A

* col 1
*xtreg midt deltadt year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if base47==1, fe vce(robust)
*reg midt deltadt year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if base47==1
areg midt deltadt year1-year4 causeofdeath1-causeofdeath14 if base47==1, absorb(shortnamsk) vce(cluster ctryxcause) 

outreg2 deltadt using z10tab4a, ti(z10tab4a) cti(1) excel nocons bracket noaster replace


* col 2
*reg midt deltadt deltadtlag year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if base47==1
areg midt deltadt deltadtlag year1-year4 causeofdeath1-causeofdeath14 if base47==1, absorb(shortnamsk) vce(cluster ctryxcause)

outreg2 deltadt deltadtlag using z10tab4a, cti(2) excel nocons bracket noaster append


* col 3
*reg midt deltadt deltadtlag year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if base47==1
areg midt deltadt deltadtlead year1-year4 causeofdeath1-causeofdeath14 if base47==1, absorb(shortnamsk) vce(cluster ctryxcause)

outreg2 deltadt deltadtlead using z10tab4a, cti(3) excel nocons bracket noaster append


*robustness: regressions excluding one disease at a time

* col 4
*without TB
reg midt deltadt year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if _stack!=8 & base47==1
areg midt deltadt year1-year4 causeofdeath1-causeofdeath14 if _stack!=8 & base47==1, absorb(shortnamsk) vce(cluster ctryxcause)

outreg2 deltadt using z10tab4a, cti(4) excel nocons bracket noaster append



* col 5
*without pneumonia
reg midt deltadt year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if _stack!=6 & base47==1
areg midt deltadt year1-year4 causeofdeath1-causeofdeath14 if _stack!=6 & base47==1, absorb(shortnamsk) vce(cluster ctryxcause)

outreg2 deltadt using z10tab4a, cti(5) excel nocons bracket noaster append



* col 6
*without malaria
reg midt deltadt year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if _stack!=1 & base47==1
areg midt deltadt year1-year4 causeofdeath1-causeofdeath14 if _stack!=1 & base47==1, absorb(shortnamsk) vce(cluster ctryxcause)

outreg2 deltadt using z10tab4a, cti(6) excel nocons bracket noaster append


* col 7
*without influenza
reg midt deltadt year1-year4 causeofdeath1-causeofdeath14 ctry1-ctry59 if _stack!=7 & base47==1, vce(cluster ctryxcause)
/* areg midt deltadt year1-year4 causeofdeath1-causeofdeath14 if _stack!=7 & base47==1, absorb(shortnamsk) vce(cluster ctryxcause)

outreg2 deltadt using z10tab4a, cti(7) excel nocons bracket noaster append


