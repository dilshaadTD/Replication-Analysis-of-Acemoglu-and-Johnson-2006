***********************************************************
*Creates Table 1: Descriptive Statistics
***********************************************************
clear
capture log close
cd C:\Users\Dilsat\Documents\ECN726\lifeexpectancy_Acemoglu
log using maketable1, replace

/*Data Files Used
	disease
	
*Data Files Created as Final Product
	none
	
*Data Files Created as Intermediate Product
	none*/
	
use disease, clear

* life expectancy at birth
sum lifeexpect if year==1900
sum lifeexpect if year==1900 & sample40==1
sum lifeexpect if year==1900 & startrich==1
sum lifeexpect if year==1900 & startmedium==1
sum lifeexpect if year==1900 & startpoor==1
sum lifeexpect if year==1900 & above_medmort==1
sum lifeexpect if year==1900 & above_medmort==0

sum lifeexpect if year==1940
sum lifeexpect if year==1940 & sample40==1
sum lifeexpect if year==1940 & startrich==1
sum lifeexpect if year==1940 & startmedium==1
sum lifeexpect if year==1940 & startpoor==1
sum lifeexpect if year==1940 & above_medmort==1
sum lifeexpect if year==1940 & above_medmort==0

sum lifeexpect if year==1980
sum lifeexpect if year==1980 & sample40==1
sum lifeexpect if year==1980 & startrich==1
sum lifeexpect if year==1980 & startmedium==1
sum lifeexpect if year==1980 & startpoor==1
sum lifeexpect if year==1980 & above_medmort==1
sum lifeexpect if year==1980 & above_medmort==0


* life expectancy at age 20
sum life20b if year==1940
sum life20b if year==1940 & sample40==1
sum life20b if year==1940 & startrich==1
sum life20b if year==1940 & startmedium==1
sum life20b if year==1940 & startpoor==1
sum life20b if year==1940 & above_medmort==1
sum life20b if year==1940 & above_medmort==0

sum life20b if year==1960
sum life20b if year==1960 & sample40==1
sum life20b if year==1960 & startrich==1
sum life20b if year==1960 & startmedium==1
sum life20b if year==1960 & startpoor==1
sum life20b if year==1960 & above_medmort==1
sum life20b if year==1960 & above_medmort==0

sum life20b if year==1980
sum life20b if year==1980 & sample40==1
sum life20b if year==1980 & startrich==1
sum life20b if year==1980 & startmedium==1
sum life20b if year==1980 & startpoor==1
sum life20b if year==1980 & above_medmort==1
sum life20b if year==1980 & above_medmort==0


* predicted mortality baseline instrument
sum compsjmhatit if year==1940
sum compsjmhatit if year==1940 & sample40==1
sum compsjmhatit if year==1940 & startrich==1
sum compsjmhatit if year==1940 & startmedium==1
sum compsjmhatit if year==1940 & startpoor==1
sum compsjmhatit if year==1940 & above_medmort==1
sum compsjmhatit if year==1940 & above_medmort==0


* log of population

sum logmaddpop if year==1940
sum logmaddpop if year==1940 & sample40==1
sum logmaddpop if year==1940 & startrich==1
sum logmaddpop if year==1940 & startmedium==1
sum logmaddpop if year==1940 & startpoor==1
sum logmaddpop if year==1940 & above_medmort==1
sum logmaddpop if year==1940 & above_medmort==0


sum logmaddpop if year==1980
sum logmaddpop if year==1980 & sample40==1
sum logmaddpop if year==1980 & startrich==1
sum logmaddpop if year==1980 & startmedium==1
sum logmaddpop if year==1980 & startpoor==1
sum logmaddpop if year==1980 & above_medmort==1
sum logmaddpop if year==1980 & above_medmort==0


* log of gdp

sum logtotalmaddgdp if year==1940
sum logtotalmaddgdp if year==1940 & sample40==1
sum logtotalmaddgdp if year==1940 & startrich==1
sum logtotalmaddgdp if year==1940 & startmedium==1
sum logtotalmaddgdp if year==1940 & startpoor==1
sum logtotalmaddgdp if year==1940 & above_medmort==1
sum logtotalmaddgdp if year==1940 & above_medmort==0


sum logtotalmaddgdp if year==1980
sum logtotalmaddgdp if year==1980 & sample40==1
sum logtotalmaddgdp if year==1980 & startrich==1
sum logtotalmaddgdp if year==1980 & startmedium==1
sum logtotalmaddgdp if year==1980 & startpoor==1
sum logtotalmaddgdp if year==1980 & above_medmort==1
sum logtotalmaddgdp if year==1980 & above_medmort==0


* log of gdp per capita
sum loggdppcmadd if year==1940
sum loggdppcmadd if year==1940 & sample40==1
sum loggdppcmadd if year==1940 & startrich==1
sum loggdppcmadd if year==1940 & startmedium==1
sum loggdppcmadd if year==1940 & startpoor==1
sum loggdppcmadd if year==1940 & above_medmort==1
sum loggdppcmadd if year==1940 & above_medmort==0


sum loggdppcmadd if year==1980
sum loggdppcmadd if year==1980 & sample40==1
sum loggdppcmadd if year==1980 & startrich==1
sum loggdppcmadd if year==1980 & startmedium==1
sum loggdppcmadd if year==1980 & startpoor==1
sum loggdppcmadd if year==1980 & above_medmort==1
sum loggdppcmadd if year==1980 & above_medmort==0



* life expectancy at age 20 
* (new set of expectancies at 20+20)

sum life20bb if year==1940
sum life20bb if year==1940 & sample40==1
sum life20bb if year==1940 & startrich==1
sum life20bb if year==1940 & startmedium==1
sum life20bb if year==1940 & startpoor==1
sum life20bb if year==1940 & above_medmort==1
sum life20bb if year==1940 & above_medmort==0


sum life20bb if year==1980
sum life20bb if year==1980 & sample40==1
sum life20bb if year==1980 & startrich==1
sum life20bb if year==1980 & startmedium==1
sum life20bb if year==1980 & startpoor==1
sum life20bb if year==1980 & above_medmort==1
sum life20bb if year==1980 & above_medmort==0


* log of gdp per working age population

sum logGDPperpopworkingage if year==1940
sum logGDPperpopworkingage if year==1940 & sample40==1
sum logGDPperpopworkingage if year==1940 & startrich==1
sum logGDPperpopworkingage if year==1940 & startmedium==1
sum logGDPperpopworkingage if year==1940 & startpoor==1
sum logGDPperpopworkingage if year==1940 & above_medmort==1
sum logGDPperpopworkingage if year==1940 & above_medmort==0


sum logGDPperpopworkingage if year==1980
sum logGDPperpopworkingage if year==1980 & sample40==1
sum logGDPperpopworkingage if year==1980 & startrich==1
sum logGDPperpopworkingage if year==1980 & startmedium==1
sum logGDPperpopworkingage if year==1980 & startpoor==1
sum logGDPperpopworkingage if year==1980 & above_medmort==1
sum logGDPperpopworkingage if year==1980 & above_medmort==0



* life expectancy at age 20 
* (new set of expectancies at 20+20, 
* expanded with UN data for 1990 and 2000)
* (life20new = life20bb in 1940 or 1980)

sum life20new if year==1940
sum life20new if year==1940 & sample40==1
sum life20new if year==1940 & startrich==1
sum life20new if year==1940 & startmedium==1
sum life20new if year==1940 & startpoor==1
sum life20new if year==1940 & above_medmort==1
sum life20new if year==1940 & above_medmort==0


sum life20new if year==1980
sum life20new if year==1980 & sample40==1
sum life20new if year==1980 & startrich==1
sum life20new if year==1980 & startmedium==1
sum life20new if year==1980 & startpoor==1
sum life20new if year==1980 & above_medmort==1
sum life20new if year==1980 & above_medmort==0

