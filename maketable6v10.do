***********************************************************
*Creates Table 6: First-Stage Estimates: Mean Reversion and Robustness (Panel Regressions, 1940–80) Dependent Variable: Log of Life Expectancy, in Regressions on the Base Sample
***********************************************************
clear
set more off, permanently
set matsize 800
capture log close
cd C:\Users\Dilsat\Documents\ECN726\Lifeexpectancy_Acemoglu
log using maketable6, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_original, clear

* col 1
areg  loglifeexpect compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)
reg loglifeexpect compsjmhatit yr1940-yr1980 cd1-cd217 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster)
outreg2 compsjmhatit using z10tab6, ti(z10tab6) cti(1) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) replace


* col 2
areg  loglifeexpect compsjmhatit L.loglifeexpect yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)
reg loglifeexpect compsjmhatit L.loglifeexpect yr1940-yr1980 cd1-cd217 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster)
outreg2 compsjmhatit L.loglifeexpect using z10tab6, cti(2) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append



* col 3
ivreg loglifeexpect compsjmhatit (L.loglifeexpect=L2.loglifeexpect) cd* yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, cluster(ctrycluster)

outreg2 compsjmhatit L.loglifeexpect using z10tab6, cti(3) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append




* col 5
areg  loglifeexpect compsjmhatit L.compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)
reg loglifeexpect compsjmhatit L.compsjmhatit yr1940-yr1980 cd* if year>=1940 & year<=1980 & sjbasesamplenoncomm==1, vce(cluster ctrycluster)
outreg2 compsjmhatit L.compsjmhatit using z10tab6, cti(5) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append




* col 6
areg  loglifeexpect compsjmhatit F.compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)

outreg2 compsjmhatit F.compsjmhatit using z10tab6, cti(6) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append




* col 7
areg  loglifeexpect compsjmhatit L.compsjmhatit  F.compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)

outreg2 compsjmhatit L.compsjmhatit F.compsjmhatit using z10tab6, cti(7) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append




* col 8
areg loglifeexpect compsjmhatit L.loggdppcmadd yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)

outreg2 compsjmhatit L.loggdppcmadd using z10tab6, cti(8) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append




* col 9
areg loglifeexpect compsjmhatit L.loglifeexpect L.loggdppcmadd yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, absorb(ctry) vce(cluster ctrycluster)

outreg2 compsjmhatit L.loglifeexpect L.loggdppcmadd  using z10tab6, cti(9) excel nocons bracket noaster addstat(Number of Countries, e(N_clust)) append


