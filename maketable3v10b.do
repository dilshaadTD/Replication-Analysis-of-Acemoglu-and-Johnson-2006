***********************************************************
*Creates Table 3: Life Expectancy, GDP, GDP per Capita, and GDP per Working Age Population: OLS Estimates
***********************************************************
clear
capture log close
cd C:\Users\Dilsat\Documents\ECN726\lifeexpectancy_Acemoglu
log using maketable3v10, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease_original, clear
tsset ctry year

*Panel A log gdp


* col 1
xtreg  logtotalmaddgdp loglifeexpect yr1960 yr2000 if (year==1960 | year==2000) & allcountrypanel19602000==1, fe vce(robust)

outreg2  loglifeexpect using z10tab3an, ti(z10tab3an) cti(1) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) replace

* col 2
xtreg  logtotalmaddgdp loglifeexpect yr1960 yr2000 if sjbasesamplenoncomm==1 & (year==1960 | year==2000), fe vce(robust)

outreg2  loglifeexpect using z10tab3an, cti(2) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 3
xtreg  logtotalmaddgdp loglifeexpect yr1940 yr1980 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==1980), fe vce(robust)

outreg2  loglifeexpect using z10tab3an, cti(3) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 4
xtreg  logtotalmaddgdp loglifeexpect yr1940 yr1980 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich!=1, fe vce(robust)

outreg2  loglifeexpect using z10tab3an, cti(4) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 5
xtreg  logtotalmaddgdp loglifeexpect yr1940 yr2000 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==2000), fe vce(robust)

outreg2  loglifeexpect using z10tab3an, cti(5) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 6
xtreg  logtotalmaddgdp loglifeexpect yr1940 yr2000 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==2000) & startrich!=1, fe vce(robust)

outreg2  loglifeexpect using z10tab3an, cti(6) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append






* Panel B log gdp per capita

* col 1
xtreg  loggdppcmadd loglifeexpect yr1960 yr2000 if (year==1960 | year==2000) & allcountrypanel19602000==1, fe vce(robust)

outreg2  loglifeexpect using z10tab3bn, ti(z10tab3bn) cti(1) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) replace

* col 2
xtreg  loggdppcmadd loglifeexpect yr1960 yr2000 if sjbasesamplenoncomm==1 & (year==1960 | year==2000), fe vce(robust)

outreg2  loglifeexpect using z10tab3bn, cti(2) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 3
xtreg  loggdppcmadd loglifeexpect yr1940 yr1980 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==1980), fe vce(robust)

outreg2  loglifeexpect using z10tab3bn, cti(3) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 4
xtreg  loggdppcmadd loglifeexpect yr1940 yr1980 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich!=1, fe vce(robust)

outreg2  loglifeexpect using z10tab3bn, cti(4) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 5
xtreg  loggdppcmadd loglifeexpect yr1940 yr2000 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==2000), fe vce(robust)

outreg2  loglifeexpect using z10tab3bn, cti(5) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 6
xtreg  loggdppcmadd loglifeexpect yr1940 yr2000 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==2000) & startrich!=1, fe vce(robust)

outreg2  loglifeexpect using z10tab3bn, cti(6) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append


*Panel C log gdp per working age population

* col 1
xtreg  logGDPperpopworkingage loglifeexpect yr1960 yr2000 if (year==1960 | year==2000) & allcountrypanel19602000==1, fe vce(robust)

outreg2  loglifeexpect using z10tab3cn, ti(z10tab3cn) cti(1) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) replace

* col 2
xtreg  logGDPperpopworkingage loglifeexpect yr1960 yr2000 if sjbasesamplenoncomm==1 & (year==1960 | year==2000), fe vce(robust)

outreg2  loglifeexpect using z10tab3cn, cti(2) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 3
xtreg  logGDPperpopworkingage loglifeexpect yr1940 yr1980 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==1980), fe vce(robust)

outreg2  loglifeexpect using z10tab3cn, cti(3) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 4
xtreg  logGDPperpopworkingage loglifeexpect yr1940 yr1980 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==1980) & startrich!=1, fe vce(robust)

outreg2  loglifeexpect using z10tab3cn, cti(4) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 5
xtreg  logGDPperpopworkingage loglifeexpect yr1940 yr2000 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==2000), fe vce(robust)

outreg2  loglifeexpect using z10tab3cn, cti(5) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append

* col 6
xtreg  logGDPperpopworkingage loglifeexpect yr1940 yr2000 if sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & (year==1940 | year==2000) & startrich!=1, fe vce(robust)

outreg2  loglifeexpect using z10tab3cn, cti(6) excel nocons bracket  noaster  addstat(Number of Countries, e(N_clust)) append



