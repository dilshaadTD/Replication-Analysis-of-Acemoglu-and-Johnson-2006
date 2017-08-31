***********************************************************
*Creates Table 10: Effect of Life Expectancy at Age 20 on Population, Total Births, GDP, and per Capita GDP: 2SLS Estimates and First Stages
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\Lifeexpectancy_Acemoglu
log using maketable10, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_original, clear


*Panel A dependent var log population

*col 1
ivreg  logmaddpop (loglife20new=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_a, ti(population) cti(1) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) replace


*col 2: non-rich
ivreg  logmaddpop (loglife20new=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_a, cti(2) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 3
ivreg  logmaddpop (loglife20new=compsjmhatit) cd* yr1940 yr2000 if sample40==1  & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_a , cti(3) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4
ivreg  logmaddpop (loglife20new=compsjmhatit) cd* yr1940 yr2000 if sample40==1  & (year==1940 | year==2000)  & sjbasesamplenoncomm==1 & startrich!=1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_a, cti(4) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*
*col 5
ivreg  logmaddpop (loglife20new=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_a , cti(5) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append





*Panel B dependent var log of total births

*col 1
ivreg  logtotalbirths (loglife20new=compsjmhatit) cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_b , ti(total births) cti(1) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) replace


**
*col 2: non-rich
ivreg  logtotalbirths (loglife20new=compsjmhatit) cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_b, cti(2) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*
*col 3
ivreg  logtotalbirths (loglife20new=compsjmhatit) cd* yr1940 yr1990 if country!="Brazil" & sample40==1 & (year==1940 | year==1990)  & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_b, cti(3) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*
*col 4
ivreg  logtotalbirths (loglife20new=compsjmhatit) cd* yr1940 yr1990 if country!="Brazil" & sample40==1 & (year==1940 | year==1990)  & sjbasesamplenoncomm==1 & startrich!=1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_b , cti(4) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append



*
*col 5
ivreg  logtotalbirths (loglife20new=globmort1000) cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_b , cti(5) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append




*Panel C dependent var log of gdp

*col 1
ivreg  logtotalmaddgdp (loglife20new=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_c, ti(gdp) cti(1) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) replace



*col 2: non-rich
ivreg  logtotalmaddgdp (loglife20new=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_c , cti(3) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append



*col 3
ivreg  logtotalmaddgdp (loglife20new=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_c , cti(3) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4
ivreg  logtotalmaddgdp (loglife20new=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1 & startrich!=1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_c , cti(4) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append



*col 5
ivreg  logtotalmaddgdp (loglife20new=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_c , cti(5) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append





*Panel D log of per capita gdp

*col 1
ivreg  loggdppcmadd (loglife20new=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_d, ti(gdp per capita) cti(1) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2: non-rich
ivreg  loggdppcmadd (loglife20new=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_d , cti(2) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 3
ivreg  loggdppcmadd (loglife20new=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_d, cti(3) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 4
ivreg  loggdppcmadd (loglife20new=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1 & startrich!=1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_d, cti(4) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append



*col 5
ivreg  loggdppcmadd (loglife20new=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, cluster(ctrycluster) robust

outreg  loglife20new using tab10new20_d , cti(5) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append




* Panel E first stages

tsset ctry year

*col 1: just 1940 and 1980

xtreg  loglife20new compsjmhatit yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, fe cluster(ctrycluster) robust

outreg  compsjmhatit using tab10new20_e , ti(first stages) cti(1) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) replace


*col 2: not initially rich

xtreg  loglife20new compsjmhatit yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1 & startrich~=1, fe cluster(ctrycluster) robust

outreg  compsjmhatit using tab10new20_e , cti(2) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 3: just 1940 and 2000

xtreg  loglife20new compsjmhatit yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & sjbasesamplenoncomm==1, fe cluster(ctrycluster) robust

outreg  compsjmhatit using tab10new20_e , cti(3) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: just 1940 and 2000 not initially rich

xtreg  loglife20new compsjmhatit yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & sjbasesamplenoncomm==1 & startrich!=1, fe cluster(ctrycluster) robust

outreg  compsjmhatit using tab10new20_e , cti(4) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append



*col 5 using global mortality rate base sample

xtreg  loglife20new globmort1000 yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, fe cluster(ctrycluster) robust

outreg  globmort1000 using tab10new20_e, cti(5) nol nocons se bracket noaster  addstat(Number of Countries, e(N_clust)) append






