***********************************************************
*Creates Table 9: Effect of Life Expectancy on GDP, per Capita GDP, and GDP per Working Age Population: 2SLS Estimates
***********************************************************
clear
set more off, permanently
capture log close
cd C:\Users\Dilsat\Documents\ECN726\lifeexpectancy_Acemoglu
log using maketable9, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_original, clear

*Panel A log gdp 


*col 1
ivregress 2sls   logtotalmaddgdp (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, ti(z10clusttab9a) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   logtotalmaddgdp (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   logtotalmaddgdp (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   logtotalmaddgdp (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   logtotalmaddgdp (loglifeexpect=compsjmhatit) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab9a, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 6
*interaction with own initial value
ivregress 2sls   logtotalmaddgdp (loglifeexpect=compsjmhatit) logtotalmaddgdp301950-logtotalmaddgdp301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small


outreg2  loglifeexpect logtotalmaddgdp301980 using z10clusttab9a, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 7
ivregress 2sls   logtotalmaddgdp (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9a, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append






*Panel B log per capita gdp

*col 1
ivregress 2sls   loggdppcmadd (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, ti(z10clusttab9b) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   loggdppcmadd (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   loggdppcmadd (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   loggdppcmadd (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   loggdppcmadd (loglifeexpect=compsjmhatit) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab9b, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 6
*interaction with own initial value
ivregress 2sls  loggdppcmadd (loglifeexpect=compsjmhatit)  loggdppcmadd301950-loggdppcmadd301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect loggdppcmadd301980 using z10clusttab9b, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 7
ivregress 2sls   loggdppcmadd (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9b, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append




*Panel C log gdp per working age population

*col 1
ivregress 2sls   logGDPperpopworkingage (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, ti(z10clusttab9c) cti(1) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) replace

*col 2
ivregress 2sls   logGDPperpopworkingage (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, cti(2) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 3: non-rich
ivregress 2sls   logGDPperpopworkingage (loglifeexpect=compsjmhatit) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, cti(3) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append


*col 4: non-rich
ivregress 2sls   logGDPperpopworkingage (loglifeexpect=compsjmhatit) cd* yr1940 yr2000 if sample40==1 & (year==1940 | year==2000) & startrich~=1 & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect using z10clusttab9c, cti(4) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 5
ivregress 2sls   logGDPperpopworkingage (loglifeexpect=compsjmhatit) yr1950xavcons506070-yr1980xavcons506070 cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect yr1980xavcons506070 using z10clusttab9c, cti(5) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 6
*interaction with own initial value
ivregress 2sls  logGDPperpopworkingage (loglifeexpect=compsjmhatit)  logGDPperpopworkingage301950-logGDPperpopworkingage301980 cd* yr1940 yr1980 if  (sample40==1 & sample80==1) & (year==1940 | year==1980)  & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2  loglifeexpect logGDPperpopworkingage301980 using z10clusttab9c, cti(6) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append

*col 7
ivregress 2sls   logGDPperpopworkingage (loglifeexpect=globmort1000) cd* yr1940 yr1980 if (sample40==1 & sample80==1) & (year==1940 | year==1980) & sjbasesamplenoncomm==1, vce(cluster ctrycluster) small

outreg2 loglifeexpect using z10clusttab9c, cti(7) excel nocons bracket noaster  addstat(Number of Countries, e(N_clust)) append
