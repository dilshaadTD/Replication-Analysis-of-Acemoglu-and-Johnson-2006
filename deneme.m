clear; 
clc;
load disease
%Col 1
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 year];
A = A(sum(A,2)~=inf & year>=1940 & year<=1980 ,:);
cc=A(:,2);
y = A(:,8);
c40 = mean(cc(y==1940));
cc(y==1940)=cc(y==1940)-c40;
c50 = mean(cc(y==1950));
cc(y==1950)=cc(y==1950)-c50;
c60 = mean(cc(y==1960));
cc(y==1960)=cc(y==1960)-c60;
c70 = mean(cc(y==1970));
cc(y==1970)=cc(y==1970)-c70;
c80 = mean(cc(y==1980));
cc(y==1980)=cc(y==1980)-c80;
B = [cc A(:,3:6)];
ll=A(:,1);
l40 = mean(ll(y==1940));
ll(y==1940)=ll(y==1940)-c40;
l50 = mean(ll(y==1950));
ll(y==1950)=ll(y==1950)-l50;
l60 = mean(ll(y==1960));
ll(y==1960)=ll(y==1960)-l60;
l70 = mean(ll(y==1970));
ll(y==1970)=ll(y==1970)-l70;
l80 = mean(ll(y==1980));
ll(y==1980)=ll(y==1980)-l80;





beta = inv(B'*B)*B'*ll;
e=ll-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table5(7,1) = beta(1);
table5(8,1) = se(1,1); %robust standard error
table5(9,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
%table5(10,1) = 2*length(A); %number of observations
table5(11,1) = length(A); % number of countries