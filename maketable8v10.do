***********************************************************
*Creates Table 8: Effect of Life Expectancy on Population, Total Births, and Population under Age 20: 2SLS Estimates
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\Lifeexpectancy_Acemoglu
log using maketable8, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_original, clear

*Panel A log population
*col 1
ivregress 2sls logmaddpop (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8a, ti(z10clusttab8a) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   logmaddpop (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1  & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8a, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   logmaddpop (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8a, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   logmaddpop (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8a, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 5
ivregress 2sls   logmaddpop (loglifeexpect=compsjmhatit) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab8a, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 6
*interaction with own initial value
ivregress 2sls   logmaddpop (loglifeexpect=compsjmhatit)  logmaddpop301950-logmaddpop301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect logmaddpop301980 using z10clusttab8a, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 7
ivregress 2sls   logmaddpop (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8a, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append





*Panel B log of total births

*col 1
ivregress 2sls   logtotalbirths (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8b, ti(z10clusttab8b) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*
*col 2
ivregress 2sls   logtotalbirths (loglifeexpect=compsjmhatit) cd* yr1940 yr1990 if country!="Brazil" & sample40==1 & (year==1940 | year==1990)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8b, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

**
*col 3: non-rich
ivregress 2sls   logtotalbirths (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8b, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   logtotalbirths (loglifeexpect=compsjmhatit) cd* yr1940 yr1990 if country!="Brazil" & sample40==1 & (year==1940 | year==1990) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8b, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*
*col 5
ivregress 2sls   logtotalbirths (loglifeexpect=compsjmhatit) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab8b, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*
*col 6
*interaction with own initial value
ivregress 2sls   logtotalbirths (loglifeexpect=compsjmhatit)  logtotalbirths301950-logtotalbirths301980 cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect logtotalbirths301980 using z10clusttab8b, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*
*col 7
ivregress 2sls   logtotalbirths (loglifeexpect=globmort1000) cd* yr1940 yr1980 if country!="Brazil" & (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8b, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append




*Panel C fraction of population under age 20

*col 1
ivregress 2sls   poppct20 (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8c, ti(z10clusttab8c) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   poppct20 (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1  & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8c, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   poppct20 (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8c, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 4: non-rich
ivregress 2sls   poppct20 (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8c, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   poppct20 (loglifeexpect=compsjmhatit) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab8c, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 6
*interaction with own initial value
ivregress 2sls   poppct20 (loglifeexpect=compsjmhatit)  poppct20401950-poppct20401980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect poppct20401980 using z10clusttab8c, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 7
ivregress 2sls   poppct20 (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab8c, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append




