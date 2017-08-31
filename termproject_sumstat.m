clc;
clear;
load disease;
ds = [];

%life expectancy at birth in 1900
le = lifeexpect;
le1 = le(le~=inf & year == 1900);
le2 = le(le~=inf & year == 1900 & sample40==1);
le3 = le(le~=inf & year == 1900 & startrich==1);
le4 = le(le~=inf & year == 1900 & startmedium==1);
le5 = le(le~=inf & year == 1900 & startpoor==1);
le6 = le(le~=inf & year == 1900 & above_medmort==1);
le7 = le(le~=inf & year == 1900 & above_medmort==0);
ds(1,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(2,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

%life expectancy at birth in 1940
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(3,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(4,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

%life expectancy at birth in 1980
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1980);
le2 = le(le~=inf & year == 1980 & sample40==1);
le3 = le(le~=inf & year == 1980 & startrich==1);
le4 = le(le~=inf & year == 1980 & startmedium==1);
le5 = le(le~=inf & year == 1980 & startpoor==1);
le6 = le(le~=inf & year == 1980 & above_medmort==1);
le7 = le(le~=inf & year == 1980 & above_medmort==0);
ds(5,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(6,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

%life expectancy at age 20 in 1940
clear le le1 le2 le3 le4 le5 le6 le7;
le = life20b;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(7,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(8,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

%life expectancy at age 20 in 1960
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1960);
le2 = le(le~=inf & year == 1960 & sample40==1);
le3 = le(le~=inf & year == 1960 & startrich==1);
le4 = le(le~=inf & year == 1960 & startmedium==1);
le5 = le(le~=inf & year == 1960 & startpoor==1);
le6 = le(le~=inf & year == 1960 & above_medmort==1);
le7 = le(le~=inf & year == 1960 & above_medmort==0);
ds(9,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(10,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

%life expectancy at age 20 in 1980
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1980);
le2 = le(le~=inf & year == 1980 & sample40==1);
le3 = le(le~=inf & year == 1980 & startrich==1);
le4 = le(le~=inf & year == 1980 & startmedium==1);
le5 = le(le~=inf & year == 1980 & startpoor==1);
le6 = le(le~=inf & year == 1980 & above_medmort==1);
le7 = le(le~=inf & year == 1980 & above_medmort==0);
ds(11,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(12,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% predicted mortality baseline instrument
clear le le1 le2 le3 le4 le5 le6 le7;
le = compsjmhatit;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(13,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(14,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of population in 1940
clear le le1 le2 le3 le4 le5 le6 le7;
le = logmaddpop;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(15,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(16,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of population in 1980
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1980);
le2 = le(le~=inf & year == 1980 & sample40==1);
le3 = le(le~=inf & year == 1980 & startrich==1);
le4 = le(le~=inf & year == 1980 & startmedium==1);
le5 = le(le~=inf & year == 1980 & startpoor==1);
le6 = le(le~=inf & year == 1980 & above_medmort==1);
le7 = le(le~=inf & year == 1980 & above_medmort==0);
ds(17,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(18,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of GDP in 1940
clear le le1 le2 le3 le4 le5 le6 le7;
le = logtotalmaddgdp;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(19,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(20,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of GDP in 1980
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1980);
le2 = le(le~=inf & year == 1980 & sample40==1);
le3 = le(le~=inf & year == 1980 & startrich==1);
le4 = le(le~=inf & year == 1980 & startmedium==1);
le5 = le(le~=inf & year == 1980 & startpoor==1);
le6 = le(le~=inf & year == 1980 & above_medmort==1);
le7 = le(le~=inf & year == 1980 & above_medmort==0);
ds(21,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(22,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of GDP pc in 1940
clear le le1 le2 le3 le4 le5 le6 le7;
le = loggdppcmadd;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(23,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(24,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of GDP pc in 1980
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1980);
le2 = le(le~=inf & year == 1980 & sample40==1);
le3 = le(le~=inf & year == 1980 & startrich==1);
le4 = le(le~=inf & year == 1980 & startmedium==1);
le5 = le(le~=inf & year == 1980 & startpoor==1);
le6 = le(le~=inf & year == 1980 & above_medmort==1);
le7 = le(le~=inf & year == 1980 & above_medmort==0);
ds(25,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(26,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log GDP per population working age in 1940
clear le le1 le2 le3 le4 le5 le6 le7;
le = lnGDPperpopworkage;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(27,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(28,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% log of GDP pc in 1980
clear le1 le2 le3 le4 le5 le6 le7;
le1 = le(le~=inf & year == 1980);
le2 = le(le~=inf & year == 1980 & sample40==1);
le3 = le(le~=inf & year == 1980 & startrich==1);
le4 = le(le~=inf & year == 1980 & startmedium==1);
le5 = le(le~=inf & year == 1980 & startpoor==1);
le6 = le(le~=inf & year == 1980 & above_medmort==1);
le7 = le(le~=inf & year == 1980 & above_medmort==0);
ds(29,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(30,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

% index
clear le le1 le2 le3 le4 le5 le6 le7;
le = index;
le1 = le(le~=inf & year == 1940);
le2 = le(le~=inf & year == 1940 & sample40==1);
le3 = le(le~=inf & year == 1940 & startrich==1);
le4 = le(le~=inf & year == 1940 & startmedium==1);
le5 = le(le~=inf & year == 1940 & startpoor==1);
le6 = le(le~=inf & year == 1940 & above_medmort==1);
le7 = le(le~=inf & year == 1940 & above_medmort==0);
ds(31,:)=[mean(le1) mean(le2) mean(le3) mean(le4) mean(le5) mean(le6) mean(le7)];
ds(32,:)=[std(le1) std(le2) std(le3) std(le4) std(le5) std(le6) std(le7)];

%dlmwrite('table_ds.txt',ds,'delimiter','\t','precision','%.6f');
xlswrite('tables.xls',ds,1,'B2');