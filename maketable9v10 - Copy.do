***********************************************************
*Creates Table 9ex: Effect of Life Expectancy on GDP, per Capita GDP, and GDP per Working Age Population: 2SLS Estimates
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\lifeexpectancy_Acemoglu
log using maketable9ex, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease, clear

*Panel A log gdp 


*col 1
ivregress 2sls   logtotalmaddgdp (loglifeexpect=index) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, ti(z10clusttab9a) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   logtotalmaddgdp (loglifeexpect=index) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   logtotalmaddgdp (loglifeexpect=index) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   logtotalmaddgdp (loglifeexpect=index) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   logtotalmaddgdp (loglifeexpect=index) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab9a, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 6
*interaction with own initial value
ivregress 2sls   logtotalmaddgdp (loglifeexpect=index) lntotmaddgdp301950-lntotmaddgdp301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small


outreg2  loglifeexpect lntotmaddgdp301980 using z10clusttab9a, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 7
ivregress 2sls   logtotalmaddgdp (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append






*Panel B log per capita gdp

*col 1
ivregress 2sls   loggdppcmadd (loglifeexpect=index) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, ti(z10clusttab9b) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   loggdppcmadd (loglifeexpect=index) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   loggdppcmadd (loglifeexpect=index) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   loggdppcmadd (loglifeexpect=index) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   loggdppcmadd (loglifeexpect=index) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab9b, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 6
*interaction with own initial value
ivregress 2sls  loggdppcmadd (loglifeexpect=index)  loggdppcmadd301950-loggdppcmadd301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect loggdppcmadd301980 using z10clusttab9b, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 7
ivregress 2sls   loggdppcmadd (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append




*Panel C log gdp per working age population

*col 1
ivregress 2sls   lnGDPperpopworkage (loglifeexpect=index) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, ti(z10clusttab9c) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   lnGDPperpopworkage (loglifeexpect=index) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   lnGDPperpopworkage (loglifeexpect=index) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   lnGDPperpopworkage (loglifeexpect=index) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   lnGDPperpopworkage (loglifeexpect=index) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab9c, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 6
*interaction with own initial value
ivregress 2sls  lnGDPperpopworkage (loglifeexpect=index)  lGDPperpowage301950-lGDPperpowage301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect lGDPperpowage301980 using z10clusttab9c, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 7
ivregress 2sls   lnGDPperpopworkage (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2 loglifeexpect using z10clusttab9c, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append
