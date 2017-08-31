***********************************************************
*Creates Table 5: First-Stage Estimates: Predicted Mortality and Life Expectancy Dependent Variable: Log Life Expectancy
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\lifeexpectancy_Acemoglu
log using maketable5, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_original, clear
tsset ctry year


*********

*Panel A: long differences 

*col 1: just 1940 and 1980 all available countries
xtreg  loglifeexpect compsjmhatit yr1940 yr1980 if (year==1940 | year==1980) & t51sample==1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5a, ti(z10tab5a) cti(1) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) replace

*col 2: just 1940 and 1980
xtreg  loglifeexpect compsjmhatit yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5a, cti(2) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 3: just 1940 and 2000
xtreg  loglifeexpect compsjmhatit yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5a, cti(3) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 4: not initially rich
xtreg  loglifeexpect compsjmhatit yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1 & startrich~=1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5a, cti(4) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append


*col 5: interact with initial institutions
xtreg  loglifeexpect compsjmhatit yr1950xavcons506070-yr1980xavcons506070 yr1940 yr1980  if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster) 

outreg2  compsjmhatit using z10tab5a, cti(5) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 6: interact with 1930 GDP pc
xtreg  loglifeexpect compsjmhatit yr1950xloggdppcmadd30-yr1980xloggdppcmadd30 yr1940 yr1980  if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) fe

outreg2  compsjmhatit using z10tab5a, cti(6) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 7: interact with continent dummies
xtreg  loglifeexpect compsjmhatit yr1950xauscont-yr1980xauscont yr1950xasia-yr1980xasia yr1950xafrica-yr1980xafrica yr1950xeurope-yr1980xeurope yr1950xamerica-yr1980xamerica yr1940 yr1980  if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5a, cti(7) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 8 using global mortality rate base sample
xtreg  loglifeexpect globmort1000 yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  globmort1000 using z10tab5a, cti(8) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 9: using global mortality rate not initially rich
xtreg  loglifeexpect globmort1000 yr1940 yr1980 if startrich~=1 & sample40==1 & sample80==1 & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  globmort1000 using z10tab5a, cti(9) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append



*Panel b: 

*col 1: 1940-80 all available countries
xtreg  loglifeexpect compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980), fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5b, ti(z10tab5b) cti(1) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) replace
/*

*col 2: 1940-80 base sample
xtreg  loglifeexpect compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5b, cti(2) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 3: 1940-2000
xtreg  loglifeexpect compsjmhatit yr1940-yr2000 if (year>=1940 & year<=2000) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5b, cti(3) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 4: not rich: startrich=1 if loggdppcmadd40>8.34 & loggdppcmadd40~=.
xtreg  loglifeexpect compsjmhatit yr1940-yr1980 if (year>=1940 & year<=1980)& sjbasesamplenoncomm==1 & startrich~=1, fe vce(cluster ctrycluster)

outreg2  compsjmhatit using z10tab5b, cti(4) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append


*col 5: interact with institutions
xtreg  loglifeexpect compsjmhatit yr1950xavcons506070-yr1980xavcons506070 yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) fe

outreg2  compsjmhatit using z10tab5b, cti(5) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

*col 6: interact with initial GDP in 1930
xtreg  loglifeexpect compsjmhatit yr1950xloggdppcmadd30-yr1980xloggdppcmadd30 yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) fe

outreg2  compsjmhatit using z10tab5b, cti(6) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append


*col 7: interact with continent dummies
xtreg  loglifeexpect compsjmhatit yr1950xauscont-yr1980xauscont yr1950xasia-yr1980xasia yr1950xafrica-yr1980xafrica yr1950xeurope-yr1980xeurope yr1950xamerica-yr1980xamerica yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) fe

outreg2  compsjmhatit using z10tab5b, cti(7) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append


*col 8 using global mortality rate base sample
xtreg  loglifeexpect globmort1000 yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1, fe vce(cluster ctrycluster)

outreg2  globmort1000 using z10tab5b, cti(8) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append


*col 9 using global mortality rate not initially rich
xtreg  loglifeexpect globmort1000 yr1940-yr1980 if (year>=1940 & year<=1980) & sjbasesamplenoncomm==1 & startrich~=1, fe vce(cluster ctrycluster)

outreg2  globmort1000 using z10tab5b, cti(9) excel nocons bracket noaster   addstat(Number of Countries, e(N_clust)) append

