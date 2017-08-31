clc;
clear;
load ac2;
d=unique(ctry);
t=[];
k=0;
for i=1:length(d)
        s40= mean(index(ctry== d(i) & year>=1940 & year<1950));
        s50= mean(index(ctry == d(i) & year>=1950 & year<1960));
        s60= mean(index(ctry == d(i) & year>=1960 & year<1970));
        s70= mean(index(ctry == d(i) & year>=1970 & year<1980));
        s80= mean(index(ctry == d(i) & year>=1980 & year<1990));
        s90= mean(index(ctry == d(i) & year>=1990 & year<2000));
        s00= mean(index(ctry == d(i) & year>=2000 & year<2100));
        t(i+k:i+k+6,1)=d(i);
        t(i+k:i+k+6,2)=[1940 1950 1960 1970 1980 1990 2000];
        t(i+k:i+k+6,3)=[s40 s50 s60 s70 s80 s90 s00];
        k=k+6;
end
dlmwrite('ac2.txt',t,'delimiter',',')