% This m-file conducts the following exercises respectively,
% 1. Sargan Test for the armed conflict instrument : index
% 2. Analyzing the effect of life expectancy on population growth (Table 8ex)
% 3. Analyzing the effect of life expectancy on GDP data (Table 9ex)

clc;
clear;
load disease;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sargan Test for armed conflict %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Armed conflict index is denoted by "index" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Log GDP
%%years 1940-1980
A=[logtotalmaddgdp index loglifeexpect yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr1980 is omitted due to collinearity 
Z = A(:,2:3);
q=1;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-2000
A=[logtotalmaddgdp index loglifeexpect yr1940 yr2000];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=2;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-1980, not rich
A=[logtotalmaddgdp index loglifeexpect yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1& sample80==1  & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=3;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-2000, not rich
A=[logtotalmaddgdp index loglifeexpect yr1940 yr2000];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==2000), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=4;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-1980, interaction with institutions
A=[logtotalmaddgdp index loglifeexpect yr1950xavcons506070...
   yr1960xavcons506070-yr1970xavcons506070 yr1980xavcons506070 yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,end-2:end-1); % yr2000 and other instutitutional variables are omitted due to collinearity 
Z = A(:,2:3);
q=5;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Log GDP per capita
%%%%years 1940-1980
A=[loggdppcmadd index loglifeexpect yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr1980 is omitted due to collinearity 
Z = A(:,2:3);
q=1;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-2000
A=[loggdppcmadd index loglifeexpect yr1940 yr2000];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=2;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-1980, not rich
A=[loggdppcmadd index loglifeexpect yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1& sample80==1  & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=3;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-2000, not rich
A=[loggdppcmadd index loglifeexpect yr1940 yr2000];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==2000), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=4;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-1980, interaction with institutions
A=[loggdppcmadd index loglifeexpect yr1950xavcons506070...
   yr1960xavcons506070-yr1970xavcons506070 yr1980xavcons506070 yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,end-2:end-1); % yr2000 and other instutitutional variables are omitted due to collinearity 
Z = A(:,2:3);
q=5;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Log GDP per working age population
%%%%years 1940-1980
A=[ lnGDPperpopworkage index loglifeexpect yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr1980 is omitted due to collinearity 
Z = A(:,2:3);
q=1;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-2000
A=[lnGDPperpopworkage index loglifeexpect yr1940 yr2000];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=2;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-1980, not rich
A=[lnGDPperpopworkage index loglifeexpect yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1& sample80==1  & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=3;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-2000, not rich
A=[lnGDPperpopworkage index loglifeexpect yr1940 yr2000];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==2000), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,4); % yr2000 is omitted due to collinearity 
Z = A(:,2:3);
q=4;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%% years 1940-1980, interaction with institutions
A=[lnGDPperpopworkage index loglifeexpect yr1950xavcons506070...
   yr1960xavcons506070-yr1970xavcons506070 yr1980xavcons506070 yr1940 yr1980];
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
N=length(A(:,1));
Y = A(:,1);
X = A(:,end-2:end-1); % yr2000 and other instutitutional variables are omitted due to collinearity 
Z = A(:,2:3);
q=5;
[beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear A X Y Z N q;
table8ex= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Table 8ex: Effects of Life Expectancy on Pop., Tot. Births,%% 
%%%%%%%%%%%%%% Pop Under 20: 2SLS Estimates%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A
%Col 1
A = [logmaddpop loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,1) = beta(1);
table8ex(2,1) = se(1,1); %robust standard error
table8ex(5,1) = C+2; %number of countries

%Col 2
A = [logmaddpop loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,2) = beta(1);
table8ex(2,2) = se(1,1); %robust standard error
table8ex(5,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [logmaddpop loglifeexpect index cd8 cd13 cd19 cd28 cd38...
cd39 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,3) = beta(1);
table8ex(2,3) = se(1,1); %robust standard error
table8ex(5,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [logmaddpop loglifeexpect index cd8 cd13 cd19 cd28 cd38...
cd39 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==2000), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,4) = beta(1);
table8ex(2,4) = se(1,1); %robust standard error
table8ex(5,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [logmaddpop loglifeexpect index yr1980xavcons506070 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980, yr1950xavcons506070...
                                                                          %yr1960xavcons506070 yr1970xavcons506070 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,5) = beta(1);
table8ex(2,5) = se(1,1); %robust standard error
table8ex(3,5)= beta(2);
table8ex(4,5)=se(2,2);
table8ex(5,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [logmaddpop loglifeexpect index logmaddpop301980 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980, and other logmaddpop variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,6) = beta(1);
table8ex(2,6) = se(1,1); %robust standard error
table8ex(3,6)= beta(2);
table8ex(4,6)= se(2,2);
table8ex(5,6) = C+2; %number of countries

%Col 7
A = [logmaddpop loglifeexpect globmort1000 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(1,7) = beta(1);
table8ex(2,7) = se(1,1); %robust standard error
table8ex(5,7) = C+2; %number of countries

%Panel B: dependant variable : log total births
%Col 1
A = [logtotalbirths loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd35 cd36 cd38...
cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28, :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,1) = beta(1);
table8ex(8,1) = se(1,1); %robust standard error
table8ex(11,1) = C+2; %number of countries

%Col 2
A = [logtotalbirths loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd35 cd36 cd38...
cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1990) & ctry~=28, :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,2) = beta(1);
table8ex(8,2) = se(1,1); %robust standard error
table8ex(11,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [logtotalbirths loglifeexpect index cd8 cd13 cd19 cd38...
cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980) & ctry~=28, :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,3) = beta(1);
table8ex(8,3) = se(1,1); %robust standard error
table8ex(11,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [logtotalbirths loglifeexpect index cd8 cd13 cd19 cd38...
cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1990) & ctry~=28, :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,4) = beta(1);
table8ex(8,4) = se(1,1); %robust standard error
table8ex(11,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [logtotalbirths loglifeexpect index yr1980xavcons506070 cd8 cd12 cd13...
cd16 cd19 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980, yr1950xavcons506070...
                                                                          %yr1960xavcons506070 yr1970xavcons506070 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28, :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,5) = beta(1);
table8ex(8,5) = se(1,1); %robust standard error
table8ex(9,5)= beta(2);
table8ex(10,5)=se(2,2);
table8ex(11,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [logtotalbirths loglifeexpect index logmaddpop301980 cd8 cd12 cd13...
cd16 cd19 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980, and other logmaddpop variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28, :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,6) = beta(1);
table8ex(8,6) = se(1,1); %robust standard error
table8ex(9,6)= beta(2);
table8ex(10,6)= se(2,2);
table8ex(11,6) = C+2; %number of countries

%Col 7
A = [logtotalbirths loglifeexpect globmort1000 cd8 cd12 cd13...
cd16 cd19 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28, :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(7,7) = beta(1);
table8ex(8,7) = se(1,1); %robust standard error
table8ex(11,7) = C+2; %number of countries


%Panel C: dependant variable : Fraction of Population under age 20
%Col 1
A = [poppct20 loglifeexpect index cd8 cd12 cd13 cd16 cd28 cd35 cd36 cd38...
cd43 cd46 cd51 cd55 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd154...
cd155 cd156 cd162 cd176 cd183 cd189 cd202 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,1) = beta(1);
table8ex(14,1) = se(1,1); %robust standard error
table8ex(17,1) = C; %number of countries

%Col 2
A = [poppct20 loglifeexpect index cd8 cd12 cd13 cd16 cd28 cd35 cd36 cd38...
cd43 cd46 cd51 cd55 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151...
cd154 cd155 cd156 cd162 cd176 cd183 cd189 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :);
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,2) = beta(1);
table8ex(14,2) = se(1,1); %robust standard error
table8ex(17,2) = C; %number of countries

%Col 3: low and middle income countries
A = [poppct20 loglifeexpect index cd8 cd13 cd28 cd38...
cd43 cd46 cd61 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149...
cd154 cd155 cd156 cd162 cd176 cd189 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,3) = beta(1);
table8ex(14,3) = se(1,1); %robust standard error
table8ex(17,3) = C; %number of countries

%Col 4: low and middle income countries
A = [poppct20 loglifeexpect index cd8 cd13 cd28 cd38...
cd43 cd46 cd61 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149...
cd154 cd155 cd156 cd162 cd176 cd189 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1990), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,4) = beta(1);
table8ex(14,4) = se(1,1); %robust standard error
table8ex(17,4) = C; %number of countries

%Col 5: interaction with institutions
A = [poppct20 loglifeexpect index yr1980xavcons506070 cd8 cd12 cd13...
cd16 cd28 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151...
cd154 cd155 cd156 cd162 cd176 cd183 cd189 cd202 yr1940 ctry]; % some cd and yr1980, yr1950xavcons506070...
                                                                          %yr1960xavcons506070 yr1970xavcons506070 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,5) = beta(1);
table8ex(14,5) = se(1,1); %robust standard error
table8ex(15,5)= beta(2);
table8ex(16,5)=se(2,2);
table8ex(17,5) = C; %number of countries

%Col 6: interaction with initial dependant variable
A = [poppct20 loglifeexpect index poppct20401980 cd8 cd12 cd13...
cd16 cd28 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151...
cd154 cd155 cd156 cd162 cd176 cd183 cd189 cd202 yr1940 ctry]; % some cd and yr1980, and other logmaddpop variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,6) = beta(1);
table8ex(14,6) = se(1,1); %robust standard error
table8ex(15,6)= beta(2);
table8ex(16,6)= se(2,2);
table8ex(17,6) = C; %number of countries

%Col 7
A = [poppct20 loglifeexpect globmort1000 cd8 cd12 cd13...
cd16 cd28 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151...
cd154 cd155 cd156 cd162 cd176 cd183 cd189 cd202 yr1940 ctry]; % some cd and yr1980 are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table8ex(13,7) = beta(1);
table8ex(14,7) = se(1,1); %robust standard error
table8ex(17,7) = C; %number of countries


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 8ex  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

table9ex= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Table 9ex: Effects of Life Expectancy on GDP, pcGDP...%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A: Dependent Var: Log Per capita GDP
%Col 1
A = [logtotalmaddgdp loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,1) = beta(1);
table9ex(2,1) = se(1,1); %robust standard error
table9ex(5,1) = C+2; %number of countries

%Col 2
A = [logtotalmaddgdp loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38 cd39...
               cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78...
               cd81 cd86 cd90 cd92 cd93 cd98 cd108 cd116 cd127...
               cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154...
               cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,2) = beta(1);
table9ex(2,2) = se(1,1); %robust standard error
table9ex(5,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [logtotalmaddgdp loglifeexpect index  cd8 cd13 cd19 cd28 cd38 cd39 cd43 cd46 cd58 cd61...
               cd64 cd66 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
               cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,3) = beta(1);
table9ex(2,3) = se(1,1); %robust standard error
table9ex(5,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [logtotalmaddgdp loglifeexpect index cd8 cd13 cd19 cd28 cd38 cd39 cd43 cd46 cd58 cd61...
               cd64 cd66 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
               cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==2000), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,4) = beta(1);
table9ex(2,4) = se(1,1); %robust standard error
table9ex(5,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [logtotalmaddgdp loglifeexpect index yr1980xavcons506070 cd8 cd12 cd13 cd16 cd19 cd28...
               cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61...
               cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149...
               cd151 cd153 cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980, yr1950xavcons506070...
                             %yr1960xavcons506070 yr1970xavcons506070 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,5) = beta(1);
table9ex(2,5) = se(1,1); %robust standard error
table9ex(3,5)= beta(2);
table9ex(4,5)=se(2,2);
table9ex(5,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [logtotalmaddgdp loglifeexpect index lntotmaddgdp301980 cd8 cd12 cd13 cd16 cd19 cd28...
               cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149...
               cd151 cd153 cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980, and other logmaddpop variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,6) = beta(1);
table9ex(2,6) = se(1,1); %robust standard error
table9ex(3,6)= beta(2);
table9ex(4,6)= se(2,2);
table9ex(5,6) = C+2; %number of countries

%Col 7
%Col 7
A = [logtotalmaddgdp loglifeexpect globmort1000 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(1,7) = beta(1);
table9ex(2,7) = se(1,1); %robust standard error
table9ex(5,7) = C+2; %number of countries

%Panel B: dependant variable : log per capita GDP
%Col 1
A = [loggdppcmadd loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38 cd39...
               cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78...
               cd81 cd86 cd90 cd92 cd93 cd98 cd108 cd116 cd127...
               cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154...
               cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,1) = beta(1);
table9ex(8,1) = se(1,1); %robust standard error
table9ex(11,1) = C+2; %number of countries

%Col 2
A = [loggdppcmadd loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38 cd39...
               cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78...
               cd81 cd86 cd90 cd92 cd93 cd98 cd108 cd116 cd127...
               cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154...
               cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1990), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,2) = beta(1);
table9ex(8,2) = se(1,1); %robust standard error
table9ex(11,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [loggdppcmadd loglifeexpect index cd8 cd13 cd19 cd28 cd38 cd39 cd43 cd46 cd58 cd61...
               cd64 cd66 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
               cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,3) = beta(1);
table9ex(8,3) = se(1,1); %robust standard error
table9ex(11,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [loggdppcmadd loglifeexpect index cd8 cd13 cd19 cd28 cd38 cd39 cd43 cd46 cd58 cd61...
               cd64 cd66 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
               cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1990), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,4) = beta(1);
table9ex(8,4) = se(1,1); %robust standard error
table9ex(11,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [loggdppcmadd loglifeexpect index yr1980xavcons506070 cd8 cd12 cd13 cd16 cd19 cd28...
               cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61...
               cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149...
               cd151 cd153 cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980, yr1950xavcons506070...
                             %yr1960xavcons506070 yr1970xavcons506070 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,5) = beta(1);
table9ex(8,5) = se(1,1); %robust standard error
table9ex(9,5)= beta(2);
table9ex(10,5)=se(2,2);
table9ex(11,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [loggdppcmadd loglifeexpect index loggdppcmadd301980 cd8 cd12 cd13 cd16 cd19 cd28...
               cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61...
               cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149...
               cd151 cd153 cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980, and other loggdppcmadd variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,6) = beta(1);
table9ex(8,6) = se(1,1); %robust standard error
table9ex(9,6)= beta(2);
table9ex(10,6)= se(2,2);
table9ex(11,6) = C+2; %number of countries

%Col 7
A = [loggdppcmadd loglifeexpect globmort1000 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(7,7) = beta(1);
table9ex(8,7) = se(1,1); %robust standard error
table9ex(11,7) = C+2; %number of countries


%Panel C: dependant variable : Log GDP per working age population
%Col 1
A = [lnGDPperpopworkage loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38 cd43...
               cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81...
               cd86 cd90 cd92 cd93 cd98 cd108 cd116 cd127 cd132...
               cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155...
               cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,1) = beta(1);
table9ex(14,1) = se(1,1); %robust standard error
table9ex(17,1) = C; %number of countries

%Col 2
A = [lnGDPperpopworkage loglifeexpect index cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38 cd43...
               cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81...
               cd86 cd90 cd92 cd93 cd98 cd108 cd116 cd127 cd132...
               cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155...
               cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :);
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,2) = beta(1);
table9ex(14,2) = se(1,1); %robust standard error
table9ex(17,2) = C; %number of countries

%Col 3: low and middle income countries
A = [lnGDPperpopworkage loglifeexpect index cd8 cd13 cd19 cd28 cd38 cd43 cd46 cd58 cd61 cd64...
               cd66 cd78 cd81 cd86 cd90 cd92 cd93 cd98 cd108...
               cd116 cd127 cd132 cd141 cd147 cd149 cd153 cd154...
               cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,3) = beta(1);
table9ex(14,3) = se(1,1); %robust standard error
table9ex(17,3) = C; %number of countries

%Col 4: low and middle income countries
A = [lnGDPperpopworkage loglifeexpect index cd8 cd13 cd19 cd28 cd38 cd43 cd46 cd58 cd61 cd64...
               cd66 cd78 cd81 cd86 cd90 cd92 cd93 cd98 cd108...
               cd116 cd127 cd132 cd141 cd147 cd149 cd153 cd154...
               cd155 cd156 cd162 cd163 cd176 cd189 cd201 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1990), :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,4) = beta(1);
table9ex(14,4) = se(1,1); %robust standard error
table9ex(17,4) = C; %number of countries

%Col 5: interaction with institutions
A = [lnGDPperpopworkage loglifeexpect index yr1980xavcons506070 cd8 cd12 cd13 cd16 cd19 cd28...
               cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64...
               cd66 cd70 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149...
               cd151 cd153 cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980, yr1950xavcons506070...
                             %yr1960xavcons506070 yr1970xavcons506070 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,5) = beta(1);
table9ex(14,5) = se(1,1); %robust standard error
table9ex(15,5)= beta(2);
table9ex(16,5)=se(2,2);
table9ex(17,5) = C; %number of countries

%Col 6: interaction with initial dependant variable
A = [lnGDPperpopworkage loglifeexpect index lGDPperpowage301980 cd8 cd12 cd13 cd16 cd19 cd28...
               cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64...
               cd66 cd70 cd78 cd81 cd86 cd90 cd92 cd93 cd98...
               cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149...
               cd151 cd153 cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202...
               yr1940 ctry]; % some cd and yr1980, and other logmaddpop variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,6) = beta(1);
table9ex(14,6) = se(1,1); %robust standard error
table9ex(15,6)= beta(2);
table9ex(16,6)= se(2,2);
table9ex(17,6) = C; %number of countries

%Col 7
A = [lnGDPperpopworkage loglifeexpect globmort1000 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); %
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9ex(13,7) = beta(1);
table9ex(14,7) = se(1,1); %robust standard error
table9ex(17,7) = C; %number of countries


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 9ex  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlswrite('tables.xls', table8ex, 11, 'B2');
xlswrite('tables.xls', table9ex, 12, 'B2');
% 
% dlmwrite('table9ex.txt',table9ex,'delimiter','\t','precision','%.6f');
% dlmwrite('table8ex.txt',table8ex,'delimiter','\t','precision','%.6f');