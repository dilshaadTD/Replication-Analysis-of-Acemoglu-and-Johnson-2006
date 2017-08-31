% This m-file replicates table 2, 3, 4, 5, 6, 7, 8, 9, 10 in the original
% paper Acemoglu and Johnson 2006. The replications are done in the above
% order and named accordingly. 

clc;
clear;
load disease;
table2 = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Table 2: OLS Estimates %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A. Dependent Variable: Log Population
%Col 1
A = [loglifeexpect yr1960 yr2000 logmaddpop];
A0 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1)); % number of observations
K=length(B(1,:));
C=length(A(:,1))-2; % number of clusters
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*(((N-1)/(N-K))*(C/(C-1))));
table2(1,1) = beta(1);
table2(2,1) = se(1,1); %robust standard error
table2(3,1) = length(A); %number of countries

%Col 2
A = [loglifeexpect yr1960 yr2000 logmaddpop];
A0 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1)); % number of observations
K=length(B(1,:)); % number of regressors
C=length(A(:,1))-2; % number of clusters
se=sqrt((inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*(((N-1)/(N-K))*(C/(C-1))));
table2(1,2) = beta(1);
table2(2,2) = se(1,1); %robust standard error
table2(3,2) = length(A); %number of countries

%Col 3
A = [loglifeexpect yr1940 yr1980 logmaddpop];
A0 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(1,3) = beta(1);
table2(2,3) = se(1,1); %robust standard error
table2(3,3) = length(A); %number of countries

%Col 4
A = [loglifeexpect yr1940 yr1980 logmaddpop];
A0 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(1,4) = beta(1);
table2(2,4) = se(1,1); %robust standard error
table2(3,4) = length(A); %number of countries

%Col 5
A = [loglifeexpect yr1940 yr2000 logmaddpop];
A0 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(1,5) = beta(1);
table2(2,5) = se(1,1); %robust standard error
table2(3,5) = length(A); %number of countries

%Col 6
A = [loglifeexpect yr1940 yr2000 logmaddpop];
A0 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logmaddpop~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(1,6) = beta(1);
table2(2,6) = se(1,1); %robust standard error
table2(3,6) = length(A); %number of countries

%Panel B. Dependent Variable: Log Number of Births
%Col 1
A = [loglifeexpect yr1960 yr1990 logtotalbirthstwo];
A0 = A(loglifeexpect~=inf & logtotalbirthstwo~=inf & yr1960~=inf & yr1990~=inf & allctrypnl19602000==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & logtotalbirthstwo~=inf & yr1960~=inf & yr1990~=inf & allctrypnl19602000==1 & year==1990,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(4,1) = beta(1);
table2(5,1) = se(1,1); %robust standard error
table2(6,1) = length(A); %number of countries

%Col 2
A = [loglifeexpect yr1960 yr1990 logtotalbirths];
A0 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1960~=inf & yr1990~=inf & allctrypnl19602000==1 & sjbasesamplenoncomm==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1960~=inf & yr1990~=inf & allctrypnl19602000==1 & sjbasesamplenoncomm==1 & year==1990,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(4,2) = beta(1);
table2(5,2) = se(1,1); %robust standard error
table2(6,2) = length(A); %number of countries

%Col 3
A = [loglifeexpect yr1940 yr1980 logtotalbirths];
A0 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1980~=inf & ctry~=28 & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1980~=inf & ctry~=28 & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(4,3) = beta(1);
table2(5,3) = se(1,1); %robust standard error
table2(6,3) = length(A); %number of countries

%Col 4
A = [loglifeexpect yr1940 yr1980 logtotalbirths];
A0 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1980~=inf & ctry~=28 & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1980~=inf & ctry~=28 & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(4,4) = beta(1);
table2(5,4) = se(1,1); %robust standard error
table2(6,4) = length(A); %number of countries

%Col 5
A = [loglifeexpect yr1940 yr1990 logtotalbirths];
A0 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1990~=inf & ctry~=28 & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1990~=inf & ctry~=28 & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1990,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(4,5) = beta(1);
table2(5,5) = se(1,1); %robust standard error
table2(6,5) = length(A); %number of countries

%Col 6
A = [loglifeexpect yr1940 yr1990 logtotalbirths];
A0 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1990~=inf & ctry~=28 & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalbirths~=inf & yr1940~=inf & yr1990~=inf & ctry~=28 & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1990,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(4,6) = beta(1);
table2(5,6) = se(1,1); %robust standard error
table2(6,6) = length(A); %number of countries

%Panel C. Dependent Variable: Percentage of Population under Age 20
%Col 1
A = [loglifeexpect yr1960 yr2000 poppct20];
A0 = A(loglifeexpect~=inf & poppct20~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & poppct20~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(7,1) = beta(1);
table2(8,1) = se(1,1); %robust standard error
table2(9,1) = length(A); %number of countries

%Col 2
A = [loglifeexpect yr1960 yr2000 poppct20];
A0 = A(loglifeexpect~=inf & poppct20~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & poppct20~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(7,2) = beta(1);
table2(8,2) = se(1,1); %robust standard error
table2(9,2) = length(A); %number of countries

%Col 3
A = [loglifeexpect yr1940 yr1980 poppct20];
A0 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(7,3) = beta(1);
table2(8,3) = se(1,1); %robust standard error
table2(9,3) = length(A); %number of countries

%Col 4
A = [loglifeexpect yr1940 yr1980 poppct20];
A0 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(7,4) = beta(1);
table2(8,4) = se(1,1); %robust standard error
table2(9,4) = length(A); %number of countries

%Col 5
A = [loglifeexpect yr1940 yr2000 poppct20];
A0 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(7,5) = beta(1);
table2(8,5) = se(1,1); %robust standard error
table2(9,5) = length(A); %number of countries

%Col 6
A = [loglifeexpect yr1940 yr2000 poppct20];
A0 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & poppct20~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table2(7,6) = beta(1);
table2(8,6) = se(1,1); %robust standard error
table2(9,6) = length(A); %number of countries
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%Table 3: OLS Estimates %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear A B N K C beta A1 A0 e se;
table3 = [];
%Panel A. Dependent Variable: Log GDP
%Col 1
A = [loglifeexpect yr1960 yr2000 logtotalmaddgdp];
A0 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(1,1) = beta(1);
table3(2,1) = se(1,1); %robust standard error
table3(3,1) = length(A); %number of countries

%Col 2
A = [loglifeexpect yr1960 yr2000 logtotalmaddgdp];
A0 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(1,2) = beta(1);
table3(2,2) = se(1,1); %robust standard error
table3(3,2) = length(A); %number of countries

%Col 3
A = [loglifeexpect yr1940 yr1980 logtotalmaddgdp];
A0 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(1,3) = beta(1);
table3(2,3) = se(1,1); %robust standard error
table3(3,3) = length(A); %number of countries

%Col 4
A = [loglifeexpect yr1940 yr1980 logtotalmaddgdp];
A0 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(1,4) = beta(1);
table3(2,4) = se(1,1); %robust standard error
table3(3,4) = length(A); %number of countries

%Col 5
A = [loglifeexpect yr1940 yr2000 logtotalmaddgdp];
A0 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(1,5) = beta(1);
table3(2,5) = se(1,1); %robust standard error
table3(3,5) = length(A); %number of countries

%Col 6
A = [loglifeexpect yr1940 yr2000 logtotalmaddgdp];
A0 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & logtotalmaddgdp~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(1,6) = beta(1);
table3(2,6) = se(1,1); %robust standard error
table3(3,6) = length(A); %number of countries

%Panel B. Dependent Variable: Log GDP per Capita
%Col 1
A = [loglifeexpect yr1960 yr2000 loggdppcmadd];
A0 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(4,1) = beta(1);
table3(5,1) = se(1,1); %robust standard error
table3(6,1) = length(A); %number of countries

%Col 2
A = [loglifeexpect yr1960 yr2000 loggdppcmadd];
A0 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(4,2) = beta(1);
table3(5,2) = se(1,1); %robust standard error
table3(6,2) = length(A); %number of countries

%Col 3
A = [loglifeexpect yr1940 yr1980 loggdppcmadd];
A0 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(4,3) = beta(1);
table3(5,3) = se(1,1); %robust standard error
table3(6,3) = length(A); %number of countries

%Col 4
A = [loglifeexpect yr1940 yr1980 loggdppcmadd];
A0 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(4,4) = beta(1);
table3(5,4) = se(1,1); %robust standard error
table3(6,4) = length(A); %number of countries

%Col 5
A = [loglifeexpect yr1940 yr2000 loggdppcmadd];
A0 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(4,5) = beta(1);
table3(5,5) = se(1,1); %robust standard error
table3(6,5) = length(A); %number of countries

%Col 6
A = [loglifeexpect yr1940 yr2000 loggdppcmadd];
A0 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & loggdppcmadd~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(4,6) = beta(1);
table3(5,6) = se(1,1); %robust standard error
table3(6,6) = length(A); %number of countries

%Panel C. Dependent Variable: Log GDP per Working Age Population
%Col 1
A = [loglifeexpect yr1960 yr2000 lnGDPperpopworkage];
A0 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1960~=inf & yr2000~=inf & allctrypnl19602000==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(7,1) = beta(1);
table3(8,1) = se(1,1); %robust standard error
table3(9,1) = length(A); %number of countries

%Col 2
A = [loglifeexpect yr1960 yr2000 lnGDPperpopworkage];
A0 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==1960,:);
A1 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1960~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(7,2) = beta(1);
table3(8,2) = se(1,1); %robust standard error
table3(9,2) = length(A); %number of countries

%Col 3
A = [loglifeexpect yr1940 yr1980 lnGDPperpopworkage];
A0 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(7,3) = beta(1);
table3(8,3) = se(1,1); %robust standard error
table3(9,3) = length(A); %number of countries

%Col 4
A = [loglifeexpect yr1940 yr1980 lnGDPperpopworkage];
A0 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(7,4) = beta(1);
table3(8,4) = se(1,1); %robust standard error
table3(9,4) = length(A); %number of countries

%Col 5
A = [loglifeexpect yr1940 yr2000 lnGDPperpopworkage];
A0 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(7,5) = beta(1);
table3(8,5) = se(1,1); %robust standard error
table3(9,5) = length(A); %number of countries

%Col 6
A = [loglifeexpect yr1940 yr2000 lnGDPperpopworkage];
A0 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==1940,:);
A1 = A(loglifeexpect~=inf & lnGDPperpopworkage~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & startrich~=1 & (sample40==1 &sample80==1) & year==2000,:);
A = A1-A0; %long difference
B = [A(:,1) A(:,2)];
beta = inv(B'*B)*B'*A(:,4);
e=A(:,4)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table3(7,6) = beta(1);
table3(8,6) = se(1,1); %robust standard error
table3(9,6) = length(A); %number of countries
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 3  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 clc;
 clearvars -except table2 table3;
 load disease_stacked;
 table4= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  Table 4: Zeroth Stage %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Dependent Variable:Mortality per 100000 from Disease i in %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Country j at Period t %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% only midt  and disease includes missing data i.e. inf

%Col 1
A = [midt deltadt year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry26 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1,:);
B = [A(:,2:5) A(:,7:16) A(:,18:end-1) ones(length(A),1)]; % year4 and causeofdeath11 is omitted due to collinearity
beta = (inv(B'*B))*(B'*A(:,1));
e = A(:,1)-(B*beta); %error term
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,1) = beta(1); 
table4(2,1) = se(1,1);
table4(7,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,1)=length(A);

%Col 2
A = [midt deltadt deltadtlag year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry26 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1,:);
B = [A(:,2:6) A(:,8:17) A(:,19:end-1) ones(length(A),1)]; % year4 and causeofdeath11 is omitted due to collinearity
beta = inv(B'*B)*B'*A(:,1);
e = A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,2) = beta(1); 
table4(2,2) = se(1,1);
table4(3,2) = beta(2);
table4(4,2) = se(2,2);
table4(7,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,2)=length(A);

% Col 3
A = [midt deltadt deltadtlead year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry26 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1,:);
B = [A(:,2:6) A(:,8:17) A(:,19:end-1) ones(length(A),1)]; % year4 and causeofdeath12 is omitted due to collinearity
beta = inv(B'*B)*B'*A(:,1);
e = A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,3) = beta(1); 
table4(2,3) = se(1,1);
table4(5,3) = beta(2);
table4(6,3) = se(2,2);
table4(7,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,3)=length(A);

% Col 4 : Without Tuberculosis
A = [midt deltadt year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10 ctry11...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1 & a_stack~=8,:);
B = [A(:,2) A(:,4:13) A(:,15:16) A(:,18:end-1) ones(length(A),1)]; % year1 and causeofdeath8 and causeofdeath11 is omitted due to collinearity
beta = inv(B'*B)*B'*A(:,1);
e = A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,4) = beta(1); 
table4(2,4) = se(1,1);
table4(7,4) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,4)=length(A);

% Col 5 : Without Pneumonia
A = [midt deltadt year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10 ctry11...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1 & a_stack~=6,:);
B = [A(:,2) A(:,4:11) A(:,13:17) A(:,19:end-1) ones(length(A),1)]; % year1 and causeofdeath6 and causeofdeath12 is omitted due to collinearity
beta = inv(B'*B)*B'*A(:,1);
e = A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,5) = beta(1); 
table4(2,5) = se(1,1);
table4(7,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,5)=length(A);

% Col 6 : Without Malaria
A = [midt deltadt year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10 ctry11...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1 & a_stack~=1,:);
B = [A(:,2) A(:,4:6) A(:,8:18) A(:,20:end-1) ones(length(A(:,1)),1)]; % year1 and causeofdeath1 and causeofdeath13 is omitted due to collinearity
beta = inv(B'*B)*B'*A(:,1);
e = A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,6) = beta(1); 
table4(2,6) = se(1,1);
table4(7,6) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,6)=length(A);

% Col 7: Without Influenza
A = [midt deltadt year1 year2 year3 year4 causeofdeath1 causeofdeath2 causeofdeath3...
    causeofdeath4 causeofdeath5 causeofdeath6 causeofdeath7 causeofdeath8...
    causeofdeath9 causeofdeath10 causeofdeath11 causeofdeath12 causeofdeath13...
    causeofdeath14 ctry1 ctry2 ctry3 ctry4 ctry5 ctry7 ctry8 ctry9 ctry10 ctry11...
    ctry12 ctry13 ctry14 ctry15 ctry17 ctry19 ctry20 ctry21 ctry22...
    ctry23 ctry24 ctry25 ctry27 ctry28 ctry31 ctry32 ctry34...
    ctry36 ctry37 ctry38 ctry39 ctry40 ctry41 ctry42 ctry43 ctry44 ctry45 ctry46...
    ctry47 ctry48 ctry50 ctry51 ctry52 ctry55 ctry56 ctry57 ctryxcause]; % some ctry.. var's are omitted due to coll.
A = A(midt~=inf & base47==1 & a_stack~=7,:);
B = [A(:,2:5) A(:,7:12) A(:,14:16) A(:,18:end-1) ones(length(A(:,1)),1)]; % year4 and causeofdeath7 and causeofdeath11 is omitted due to collinearity
beta = inv(B'*B)*B'*A(:,1);
e = A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table4(1,7) = beta(1); 
table4(2,7) = se(1,1);
table4(7,7) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table4(8,7)=length(A);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clearvars -except table2 table3 table4;
load disease;
table5= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  Table 5: First Stage %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Dependent Variable: Log life expectancy %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A: Long Differences

%Col 1
A = [loglifeexpect compsjmhatit yr1940 yr1980];
A0 = A(loglifeexpect~=inf & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & t51sample==1 & year==1940,:);
A1 = A(loglifeexpect~=inf & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & t51sample==1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,1) = beta(1);
table5(2,1) = se(1,1); %robust standard error
table5(3,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,1) = 2*length(A); %number of observations
table5(5,1) = length(A); % number of countries
 
%Col 2
A = [loglifeexpect compsjmhatit yr1940 yr1980];
A0 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1940,:);
A1 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,2) = beta(1);
table5(2,2) = se(1,1); %robust standard error
table5(3,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,2) = 2*length(A); %number of observations
table5(5,2) = length(A); % number of countries

%Col 3
A = [loglifeexpect compsjmhatit yr1940 yr2000];
A0 = A(loglifeexpect~=inf & sample40==1 & compsjmhatit~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==1940,:);
A1 = A(loglifeexpect~=inf & sample40==1 & compsjmhatit~=inf & yr1940~=inf & yr2000~=inf & sjbasesamplenoncomm==1 & year==2000,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,3) = beta(1);
table5(2,3) = se(1,1); %robust standard error
table5(3,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,3) = 2*length(A); %number of observations
table5(5,3) = length(A); % number of countries

%Col 4: not initially rich
A = [loglifeexpect compsjmhatit yr1940 yr1980];
A0 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & year==1940,:);
A1 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & startrich~=1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,4) = beta(1);
table5(2,4) = se(1,1); %robust standard error
table5(3,4) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,4) = 2*length(A); %number of observations
table5(5,4) = length(A); % number of countries

%Col 5
A = [loglifeexpect compsjmhatit yr1940 yr1980 yr1950xavcons506070 ...
    yr1960xavcons506070 yr1970xavcons506070 yr1980xavcons506070];
A0 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1940 & yr1950xavcons506070~=inf & yr1960xavcons506070~=inf & yr1970xavcons506070~=inf & yr1980xavcons506070~=inf,:);
A1 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & compsjmhatit~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1980 & yr1950xavcons506070~=inf & yr1960xavcons506070~=inf & yr1970xavcons506070~=inf & yr1980xavcons506070~=inf,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3) A(:,8)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,5) = beta(1);
table5(2,5) = se(1,1); %robust standard error
table5(3,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,5) = 2*length(A); %number of observations
table5(5,5) = length(A); % number of countries

%Col 6:interact with 1930 GDP pc
A = [loglifeexpect compsjmhatit yr1940 yr1980 y1950xlnGDPpcmadd30 ...
    y1960xlnGDPpcmadd30 y1970xlnGDPpcmadd30 y1980xlnGDPpcmadd30];
A0 = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year==1940,:);
A1 = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3) A(:,end)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,6) = beta(1);
table5(2,6) = se(1,1); %robust standard error
table5(3,6) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,6) = 2*length(A); %number of observations
table5(5,6) = length(A); % number of countries


%Col 7: interact with continent dummies
A = [loglifeexpect compsjmhatit yr1940 yr1980 yr1950xauscont ...
    yr1960xauscont yr1970xauscont yr1980xauscont yr1950xasia ...
    yr1960xasia yr1970xasia yr1980xasia yr1950xafrica ...
    yr1960xafrica yr1970xafrica yr1980xafrica yr1950xeurope ...
    yr1960xeurope yr1970xeurope yr1980xeurope yr1950xamerica ...
    yr1960xamerica yr1970xamerica yr1980xamerica];
A0 = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year==1940,:);
A1 = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3) A(:,8) A(:,20) A(:,end)]; % the variables are omitted due to coll.
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,7) = beta(1);
table5(2,7) = se(1,1); %robust standard error
table5(3,7) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,7) = 2*length(A); %number of observations
table5(5,7) = length(A); % number of countries

%Col 8
A = [loglifeexpect globmort1000 yr1940 yr1980];
A0 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & globmort1000~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1940,:);
A1 = A(loglifeexpect~=inf & sample40==1 & sample80==1 & globmort1000~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,8) = beta(1);
table5(2,8) = se(1,1); %robust standard error
table5(3,8) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,8) = 2*length(A); %number of observations
table5(5,8) = length(A); % number of countries

%Col 9: not rich
A = [loglifeexpect globmort1000 yr1940 yr1980];
A0 = A(loglifeexpect~=inf & startrich~=1 & sample40==1 & sample80==1 & globmort1000~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1940,:);
A1 = A(loglifeexpect~=inf & startrich~=1 & sample40==1 & sample80==1 & globmort1000~=inf & yr1940~=inf & yr1980~=inf & sjbasesamplenoncomm==1 & year==1980,:);
A = A1-A0; %long difference
B = [A(:,2) A(:,3)]; % yr1980 omitted
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(A(:,1))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table5(1,9) = beta(1);
table5(2,9) = se(1,1); %robust standard error
table5(3,9) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(4,9) = 2*length(A); %number of observations
table5(5,9) = length(A); % number of countries

%Panel B:

%Col 1
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 ctry];
A = A(sum(A,2)~=inf & (year>=1940 & year<=1980),:);
BB = [A(:,2) A(:,3:6)]; % yr1980 omitted due to coll.
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,1) = beta(1);
table5(8,1) = se(1,1); %robust standard error
table5(9,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,1) = length(A); %number of observations
table5(11,1) = C+2; % number of countries

%Col 2
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 ctry];
A = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & t51sample==1 & year<=1980 & year>=1940,:);
BB = [A(:,2:5) A(:,7)]; % yr1970 omitted due to coll.
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,2) = beta(1);
table5(8,2) = se(1,1); %robust standard error
table5(9,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,2) = 2*length(A); %number of observations
table5(11,2) = length(A); % number of countries

%Col 3
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 yr1990 yr2000 ctry];
A = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & t51sample==1 & year>=1940 & year<=2000,:);
BB = [A(:,2) A(:,4:end-1)]; % yr1940 omitted due to coll.
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,3) = beta(1);
table5(8,3) = se(1,1); %robust standard error
table5(9,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,3) = 2*length(A); %number of observations
table5(11,3) = length(A); % number of countries

%Col 4
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 ctry];
A = A(sum(A,2)~=inf & startrich~=1 & sjbasesamplenoncomm==1 & t51sample==1 & year>=1940 & year<=1980,:);
BB = [A(:,2:3) A(:,5:end-1)]; % yr1950 omitted due to coll.
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,4) = beta(1);
table5(8,4) = se(1,1); %robust standard error
table5(9,4) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,4) = 2*length(A); %number of observations
table5(11,4) = length(A); % number of countries

%Col 5
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 yr1950xavcons506070 ...
    yr1960xavcons506070 yr1970xavcons506070 yr1980xavcons506070 ctry];
A = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
BB = [A(:,2:3) A(:,5:end-1)]; % yr1950 omitted
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,5) = beta(1);
table5(8,5) = se(1,1); %robust standard error
table5(9,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,5) = 2*length(A); %number of observations
table5(11,5) = length(A); % number of countries

%Col 6:interact with 1930 GDP pc
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 y1950xlnGDPpcmadd30 ...
    y1960xlnGDPpcmadd30 y1970xlnGDPpcmadd30 y1980xlnGDPpcmadd30 ctry];
A = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
BB = [A(:,2:5) A(:,7:end-1)]; % yr1970 omitted
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,6) = beta(1);
table5(8,6) = se(1,1); %robust standard error
table5(9,6) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,6) = 2*length(A); %number of observations
table5(11,6) = length(A); % number of countries


%Col 7: interact with continent dummies
A = [loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 yr1950xauscont ...
    yr1960xauscont yr1970xauscont yr1980xauscont yr1950xasia ...
    yr1960xasia yr1970xasia yr1980xasia yr1950xafrica ...
    yr1960xafrica yr1970xafrica yr1980xafrica yr1950xeurope ...
    yr1960xeurope yr1970xeurope yr1980xeurope yr1950xamerica ...
    yr1960xamerica yr1970xamerica yr1980xamerica ctry];
A = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
BB = [A(:,2:5) A(:,7) A(:,10) A(:,12:13) A(:,15:end-1)]; % some variables are omitted due to coll.
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,7) = beta(1);
table5(8,7) = se(1,1); %robust standard error
table5(9,7) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,7) = 2*length(A); %number of observations
table5(11,7) = length(A); % number of countries

%Col 8
A = [loglifeexpect globmort1000 yr1940 yr1950 yr1960 yr1970 yr1980 ctry];
A = A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
BB = [A(:,2:4) A(:,6:end-1)]; % yr1960 omitted
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table5(7,8) = beta(1);
table5(8,8) = se(1,1); %robust standard error
table5(9,8) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,8) = 2*length(A); %number of observations
table5(11,8) = length(A); % number of countries

%Col 9: not rich
A = [loglifeexpect globmort1000 yr1940 yr1950 yr1960 yr1970 yr1980 ctry];
A = A(sum(A,2)~=inf & startrich~=1 & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
BB = [A(:,2:4) A(:,6:end-1)]; % yr1960 omitted
B = [BB - ((mean(BB)')*(ones(length(A(:,1)),1)'))'  ones(length(A(:,1)),1)]; % for FE estimation
mA = mean(A(:,1));
beta = inv(B'*B)*B'*(A(:,1)-mA);
e=(A(:,1)-mA)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table5(7,9) = beta(1);
table5(8,9) = se(1,1); %robust standard error
table5(9,9) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table5(10,9) = 2*length(A); %number of observations
table5(11,9) = length(A); % number of countries

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clearvars -except table2 table3 table4 table5;
load disease;
table6= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%  Table 6: First-Stage Estimates:   %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Mean Reversion and Robustness (Panel Regressions, 1940–80)%%%%%%%%%%%%%%%
%%%Dependent Variable: Log of Life Expectancy, in Regressions on the Base Sample%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Col 1
A=[loglifeexpect compsjmhatit yr1940 yr1950 yr1960 yr1970 yr1980 cd8 cd12 cd13 cd16 cd19 cd27 cd28 cd35 cd36...
cd38 cd39 cd43 cd46 cd51 cd55 cd57 cd58 cd59 cd61 cd64 cd66 cd70 cd78 cd81 cd86...
cd90 cd92 cd93 cd94 cd95 cd98 cd108 cd111 cd116 cd122 cd127...
cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155 cd156 cd162...
cd163 cd173 cd176 cd183 cd189 cd194 cd195 cd201 cd202 cd205 cd207 ctry]; % some ctry dummies are excluded due to coll.
A = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
B = [A(:,2) A(:,4:end-1) ones(length(A),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table6(1,1) = beta(1);
table6(2,1) = se(1,1); %robust standard error
table6(13,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table6(14,1) = length(A); %number of observations
table6(15,1) = C+2; % number of countries

% Col 2
A=[loglifeexpect compsjmhatit lagmatrix(loglifeexpect,1) yr1940 yr1950...
yr1960 yr1970 yr1980 cd8 cd12 cd13 cd16 cd19 cd27 cd28 cd35 cd36...
cd38 cd39 cd43 cd46 cd51 cd55 cd57 cd58 cd59 cd61 cd64 cd66 cd70 cd78 cd81 cd86...
cd92 cd93 cd94 cd95 cd98 cd108 cd111 cd116 cd122 cd127...
cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155 cd156 cd162...
cd163 cd173 cd176 cd183 cd189 cd194 cd195 cd201 cd202 cd205 cd207 cd214 ctry]; % some ctry dummies are excluded due to coll.
A = A(sum(A,2)~=inf & ~any(isnan(A),2)& sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
B = [A(:,2:4) A(:,6:end-1) ones(length(A),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table6(1,2) = beta(1);
table6(2,2) = se(1,1); %robust standard error
table6(3,2) = beta(2);
table6(4,2) = se(2,2);
table6(13,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table6(14,2) = N; %number of observations
table6(15,2) = C+2; % number of countries

% Col 3: IV Regression 
A=[lagmatrix(loglifeexpect,1) compsjmhatit lagmatrix(loglifeexpect,2)...
yr1940 yr1950 yr1960 yr1970 yr1980 cd8 cd12 cd13 cd16 cd19 cd27 cd28 cd35 cd36...
cd38 cd39 cd43 cd46 cd51 cd55 cd57 cd58 cd59 cd61 cd64 cd66 cd70 cd78 cd81 cd86...
cd90 cd92 cd93 cd94 cd95 cd98 cd108 cd111 cd116 cd122 cd127...
cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155 cd156 cd162...
cd163 cd176 cd183 cd189 cd194 cd195 cd201 cd202 cd205 cd207 cd214]; % some ctry dummies are excluded due to coll.
A = A(sum(A,2)~=inf & ~any(isnan(A),2) & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
B = [A(:,2:4) A(:,6:end) ones(length(A),1)];
gamma = inv(B'*B)*B'*A(:,1);
estimatedlag = B*gamma; % estimated value of lagged loglifeexpect
clear B gamma;
A=[lagmatrix(loglifeexpect,1) compsjmhatit lagmatrix(loglifeexpect,2) yr1940 yr1950 yr1960 yr1970 yr1980 cd8 cd12 cd13 cd16 cd27 cd28 cd35 cd36...
cd38 cd39 cd43 cd46 cd51 cd55 cd57 cd58 cd59 cd61 cd64 cd66 cd70 cd78 cd81 cd86...
cd90 cd92 cd93 cd94 cd95 cd98 cd108 cd111 cd116 cd122 cd127...
cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155 cd156 cd162...
cd163 cd173 cd176 cd183 cd189 cd194 cd195 cd201 cd202 cd205 cd207 cd214];
A = A(sum(A,2)~=inf & ~any(isnan(A),2) & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
B = [A(:,2:3) A(:,5:end) ones(length(A),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
mA = mean(A(:,1));
table6(1,3) = beta(1);
table6(2,3) = se(1,1); %robust standard error
table6(3,3) = beta(2);
table6(4,3) = se(2,2);
table6(13,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table6(14,3) = length(A); %number of observations
table6(15,3) = length(A(1,9:end))+1; % number of countries


% Col 5
A=[loglifeexpect compsjmhatit lagmatrix(compsjmhatit,1) yr1940 yr1950...
yr1960 yr1970 yr1980 cd8 cd12 cd13 cd16 cd19 cd27 cd28 cd35 cd36...
cd38 cd39 cd43 cd46 cd51 cd55 cd57 cd58 cd59 cd61 cd64 cd66 cd70 cd78 cd81 cd86...
cd90 cd92 cd93 cd94 cd95 cd98 cd108 cd111 cd116 cd122 cd127...
cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154 cd155 cd156 cd162...
cd163 cd173 cd176 cd183 cd189 cd194 cd195 cd201 cd202 cd205 cd207]; % some ctry dummies are excluded due to coll.
A = A(sum(A,2)~=inf & ~any(isnan(A),2) & sjbasesamplenoncomm==1 & year>=1940 & year<=1980,:);
B = [A(:,2:3) A(:,5:end) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table6(1,5) = beta(1);
table6(2,5) = se(1,1); %robust standard error
table6(3,5) = beta(2);
table6(4,5) = se(2,2);
table6(13,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table6(14,5) = length(A); %number of observations
table6(15,5) = length(A(1,9:end))+1; % number of countries

%Col 6 7 8 9 are not written yet. I could not find my mistakes in the
%previous columns. Once I find them, I will continue with the other
%columns.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clearvars -except table2 table3 table4 table5 table6;
load changes0040;
table7= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Table 7: Falsification and Reduced Forms OLS %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A
%Col 1
A=[dlife dmort];
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,1) = beta(1);
table7(2,1) = se(1,1); %robust standard error
table7(3,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,1) = length(A); %number of countries

%Col 2: not rich
A=[dlife dmort];
A=A(startrich~=1, :);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,2) = beta(1);
table7(2,2) = se(1,1); %robust standard error
table7(3,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,2) = length(A); %number of countries

%Col 3
A=[dpop dmort];
A=A(sum(A,2)~=inf,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,3) = beta(1);
table7(2,3) = se(1,1); %robust standard error
table7(3,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,3) = length(A); %number of countries

%Col 4: not rich
A=[dpop dmort];
A=A(sum(A,2)~=inf & startrich~=1,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,4) = beta(1);
table7(2,4) = se(1,1); %robust standard error
table7(3,4) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,4) = length(A); %number of countries

%Col 5
A=[dgdp dmort];
A=A(sum(A,2)~=inf,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,5) = beta(1);
table7(2,5) = se(1,1); %robust standard error
table7(3,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,5) = length(A); %number of countries

%Col 6
A=[dgdp dmort];
A=A(sum(A,2)~=inf & startrich~=1,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,6) = beta(1);
table7(2,6) = se(1,1); %robust standard error
table7(3,6) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,6) = length(A); %number of countries

%Col 7
A=[dgdppc dmort];
A=A(sum(A,2)~=inf,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,7) = beta(1);
table7(2,7) = se(1,1); %robust standard error
table7(3,7) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,7) = length(A); %number of countries

%Col 8: not rich
A=[dgdppc dmort];
A=A(sum(A,2)~=inf & startrich~=1,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(1,8) = beta(1);
table7(2,8) = se(1,1); %robust standard error
table7(3,8) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(4,8) = length(A); %number of countries

%%%%%%%%%%%%%%
clearvars -except table2 table3 table4 table5 table6 table7;
load changes4080;

%Panel B
%Col 1
A=[dlife dmort];
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,1) = beta(1);
table7(7,1) = se(1,1); %robust standard error
table7(8,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,1) = length(A); %number of countries

%Col 2: not rich
A=[dlife dmort];
A=A(startrich~=1, :);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,2) = beta(1);
table7(7,2) = se(1,1); %robust standard error
table7(8,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,2) = length(A); %number of countries

%Col 3
A=[dpop dmort];
A=A(sum(A,2)~=inf,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,3) = beta(1);
table7(7,3) = se(1,1); %robust standard error
table7(8,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,3) = length(A); %number of countries

%Col 4: not rich
A=[dpop dmort];
A=A(sum(A,2)~=inf & startrich~=1,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,4) = beta(1);
table7(7,4) = se(1,1); %robust standard error
table7(8,4) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,4) = length(A); %number of countries

%Col 5
A=[dgdp dmort];
A=A(sum(A,2)~=inf,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,5) = beta(1);
table7(7,5) = se(1,1); %robust standard error
table7(8,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,5) = length(A); %number of countries

%Col 6
A=[dgdp dmort];
A=A(sum(A,2)~=inf & startrich~=1,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,6) = beta(1);
table7(7,6) = se(1,1); %robust standard error
table7(8,6) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,6) = length(A); %number of countries

%Col 7
A=[dgdppc dmort];
A=A(sum(A,2)~=inf,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,7) = beta(1);
table7(7,7) = se(1,1); %robust standard error
table7(8,7) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,7) = length(A); %number of countries

%Col 8: not rich
A=[dgdppc dmort];
A=A(sum(A,2)~=inf & startrich~=1,:);
B = [A(:, 2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B));
mA = mean(A(:,1));
table7(6,8) = beta(1);
table7(7,8) = se(1,1); %robust standard error
table7(8,8) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA)); %r_sq
table7(9,8) = length(A); %number of countries

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clearvars -except table2 table3 table4 table5 table6 table7;
load disease;
table8= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Table 8: Effects of Life Expectancy on Pop., Tot. Births,%%%% 
%%%%%%%%%%%%%% Pop Under 20: 2SLS Estimates%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A
%Col 1
A = [logmaddpop loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
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
table8(1,1) = beta(1);
table8(2,1) = se(1,1); %robust standard error
table8(5,1) = C+2; %number of countries

%Col 2
A = [logmaddpop loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
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
table8(1,2) = beta(1);
table8(2,2) = se(1,1); %robust standard error
table8(5,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [logmaddpop loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
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
table8(1,3) = beta(1);
table8(2,3) = se(1,1); %robust standard error
table8(5,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [logmaddpop loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
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
table8(1,4) = beta(1);
table8(2,4) = se(1,1); %robust standard error
table8(5,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [logmaddpop loglifeexpect compsjmhatit yr1980xavcons506070 cd8 cd12 cd13...
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
table8(1,5) = beta(1);
table8(2,5) = se(1,1); %robust standard error
table8(3,5)= beta(2);
table8(4,5)=se(2,2);
table8(5,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [logmaddpop loglifeexpect compsjmhatit logmaddpop301980 cd8 cd12 cd13...
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
table8(1,6) = beta(1);
table8(2,6) = se(1,1); %robust standard error
table8(3,6)= beta(2);
table8(4,6)= se(2,2);
table8(5,6) = C+2; %number of countries

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
table8(1,7) = beta(1);
table8(2,7) = se(1,1); %robust standard error
table8(5,7) = C+2; %number of countries

%Panel B: dependant variable : log total births
%Col 1
A = [logtotalbirths loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd35 cd36 cd38...
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
table8(7,1) = beta(1);
table8(8,1) = se(1,1); %robust standard error
table8(11,1) = C+2; %number of countries

%Col 2
A = [logtotalbirths loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd35 cd36 cd38...
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
table8(7,2) = beta(1);
table8(8,2) = se(1,1); %robust standard error
table8(11,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [logtotalbirths loglifeexpect compsjmhatit cd8 cd13 cd19 cd38...
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
table8(7,3) = beta(1);
table8(8,3) = se(1,1); %robust standard error
table8(11,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [logtotalbirths loglifeexpect compsjmhatit cd8 cd13 cd19 cd38...
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
table8(7,4) = beta(1);
table8(8,4) = se(1,1); %robust standard error
table8(11,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [logtotalbirths loglifeexpect compsjmhatit yr1980xavcons506070 cd8 cd12 cd13...
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
table8(7,5) = beta(1);
table8(8,5) = se(1,1); %robust standard error
table8(9,5)= beta(2);
table8(10,5)=se(2,2);
table8(11,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [logtotalbirths loglifeexpect compsjmhatit logmaddpop301980 cd8 cd12 cd13...
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
table8(7,6) = beta(1);
table8(8,6) = se(1,1); %robust standard error
table8(9,6)= beta(2);
table8(10,6)= se(2,2);
table8(11,6) = C+2; %number of countries

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
table8(7,7) = beta(1);
table8(8,7) = se(1,1); %robust standard error
table8(11,7) = C+2; %number of countries


%Panel C: dependant variable : Fraction of Population under age 20
%Col 1
A = [poppct20 loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd28 cd35 cd36 cd38...
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
table8(13,1) = beta(1);
table8(14,1) = se(1,1); %robust standard error
table8(17,1) = C; %number of countries

%Col 2
A = [poppct20 loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd28 cd35 cd36 cd38...
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
table8(13,2) = beta(1);
table8(14,2) = se(1,1); %robust standard error
table8(17,2) = C; %number of countries

%Col 3: low and middle income countries
A = [poppct20 loglifeexpect compsjmhatit cd8 cd13 cd28 cd38...
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
table8(13,3) = beta(1);
table8(14,3) = se(1,1); %robust standard error
table8(17,3) = C; %number of countries

%Col 4: low and middle income countries
A = [poppct20 loglifeexpect compsjmhatit cd8 cd13 cd28 cd38...
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
table8(13,4) = beta(1);
table8(14,4) = se(1,1); %robust standard error
table8(17,4) = C; %number of countries

%Col 5: interaction with institutions
A = [poppct20 loglifeexpect compsjmhatit yr1980xavcons506070 cd8 cd12 cd13...
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
table8(13,5) = beta(1);
table8(14,5) = se(1,1); %robust standard error
table8(15,5)= beta(2);
table8(16,5)=se(2,2);
table8(17,5) = C; %number of countries

%Col 6: interaction with initial dependant variable
A = [poppct20 loglifeexpect compsjmhatit poppct20401980 cd8 cd12 cd13...
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
table8(13,6) = beta(1);
table8(14,6) = se(1,1); %robust standard error
table8(15,6)= beta(2);
table8(16,6)= se(2,2);
table8(17,6) = C; %number of countries

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
table8(13,7) = beta(1);
table8(14,7) = se(1,1); %robust standard error
table8(17,7) = C; %number of countries


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear A A0 A1 B beta C N K se estllexp e;
table9= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Table 9: Effects of Life Expectancy on GDP, pcGDP...%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A: Dependent Var: Log Per capita GDP
%Col 1
A = [logtotalmaddgdp loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
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
table9(1,1) = beta(1);
table9(2,1) = se(1,1); %robust standard error
table9(5,1) = C+2; %number of countries

%Col 2
A = [logtotalmaddgdp loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
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
table9(1,2) = beta(1);
table9(2,2) = se(1,1); %robust standard error
table9(5,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [logtotalmaddgdp loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
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
table9(1,3) = beta(1);
table9(2,3) = se(1,1); %robust standard error
table9(5,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [logtotalmaddgdp loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
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
table9(1,4) = beta(1);
table9(2,4) = se(1,1); %robust standard error
table9(5,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [logtotalmaddgdp loglifeexpect compsjmhatit yr1980xavcons506070 cd8 cd12 cd13...
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
table9(1,5) = beta(1);
table9(2,5) = se(1,1); %robust standard error
table9(3,5)= beta(2);
table9(4,5)=se(2,2);
table9(5,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [logtotalmaddgdp loglifeexpect compsjmhatit lntotmaddgdp301980 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980, and other lntotmaddgdp variables are excluded due to coll.
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
table9(1,6) = beta(1);
table9(2,6) = se(1,1); %robust standard error
table9(3,6)= beta(2);
table9(4,6)= se(2,2);
table9(5,6) = C+2; %number of countries

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
table9(1,7) = beta(1);
table9(2,7) = se(1,1); %robust standard error
table9(5,7) = C+2; %number of countries

%Panel B: dependant variable : log per capita GDP
%Col 1
A = [loggdppcmadd loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
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
table9(7,1) = beta(1);
table9(8,1) = se(1,1); %robust standard error
table9(11,1) = C+2; %number of countries

%Col 2
A = [loggdppcmadd loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
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
table9(7,2) = beta(1);
table9(8,2) = se(1,1); %robust standard error
table9(11,2) = C+2; %number of countries

%Col 3: low and middle income countries
A = [loggdppcmadd loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
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
table9(7,3) = beta(1);
table9(8,3) = se(1,1); %robust standard error
table9(11,3) = C+2; %number of countries

%Col 4: low and middle income countries
A = [loggdppcmadd loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
cd39 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
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
table9(7,4) = beta(1);
table9(8,4) = se(1,1); %robust standard error
table9(11,4) = C+2; %number of countries

%Col 5: interaction with institutions
A = [loggdppcmadd loglifeexpect compsjmhatit yr1980xavcons506070 cd8 cd12 cd13...
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
table9(7,5) = beta(1);
table9(8,5) = se(1,1); %robust standard error
table9(9,5)= beta(2);
table9(10,5)=se(2,2);
table9(11,5) = C+2; %number of countries

%Col 6: interaction with initial dependant variable
A = [loggdppcmadd loglifeexpect compsjmhatit loggdppcmadd301980 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980, and other logmaddpop variables are excluded due to coll.
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
table9(7,6) = beta(1);
table9(8,6) = se(1,1); %robust standard error
table9(9,6)= beta(2);
table9(10,6)= se(2,2);
table9(11,6) = C+2; %number of countries

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
table9(7,7) = beta(1);
table9(8,7) = se(1,1); %robust standard error
table9(11,7) = C+2; %number of countries


%Panel C: dependant variable : Log GDP per working age population
%Col 1
A = [lnGDPperpopworkage loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153 cd154...
cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
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
table9(13,1) = beta(1);
table9(14,1) = se(1,1); %robust standard error
table9(17,1) = C; %number of countries

%Col 2
A = [lnGDPperpopworkage loglifeexpect compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36 cd38...
cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
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
table9(13,2) = beta(1);
table9(14,2) = se(1,1); %robust standard error
table9(17,2) = C; %number of countries

%Col 3: low and middle income countries
A = [lnGDPperpopworkage loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd92 cd90... 
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
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9(13,3) = beta(1);
table9(14,3) = se(1,1); %robust standard error
table9(17,3) = C; %number of countries

%Col 4: low and middle income countries
A = [lnGDPperpopworkage loglifeexpect compsjmhatit cd8 cd13 cd19 cd28 cd38...
cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd92 cd90... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149 cd153...
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
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9(13,4) = beta(1);
table9(14,4) = se(1,1); %robust standard error
table9(17,4) = C; %number of countries

%Col 5: interaction with institutions
A = [lnGDPperpopworkage loglifeexpect compsjmhatit yr1980xavcons506070 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
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
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9(13,5) = beta(1);
table9(14,5) = se(1,1); %robust standard error
table9(15,5)= beta(2);
table9(16,5)=se(2,2);
table9(17,5) = C; %number of countries

%Col 6: interaction with initial dependant variable
A = [lnGDPperpopworkage loglifeexpect compsjmhatit lGDPperpowage301980 cd8 cd12 cd13...
cd16 cd19 cd28 cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd90 cd92... 
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
C=length(unique(A(:,end)));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table9(13,6) = beta(1);
table9(14,6) = se(1,1); %robust standard error
table9(15,6)= beta(2);
table9(16,6)= se(2,2);
table9(17,6) = C; %number of countries

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
table9(13,7) = beta(1);
table9(14,7) = se(1,1); %robust standard error
table9(17,7) = C; %number of countries


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 9  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear A A0 A1 B beta C N K se estllexp e;
table10= [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Table 10: LAST TABLE   %%%%%%%%%%%%%%%%%%%%%%%%%%...%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Panel A: Dependent Var: Log Per capita GDP
%Col 1
A = [logmaddpop loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36...
cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
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
table10(1,1) = beta(1);
table10(2,1) = se(1,1); %robust standard error
table10(3,1) = C+2; %number of countries

%Col 2
A = [logmaddpop loglife20new compsjmhatit cd8 cd13 cd19 cd28...
cd38 cd39 cd43 cd46 cd58 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & startrich~=1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(1,2) = beta(1);
table10(2,2) = se(1,1); %robust standard error
table10(3,2) = C+2; %number of countries

%Col 3
A = [logmaddpop loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28 cd35 cd36...
cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 ctry]; % some cd and yr1980 variables are excluded due to coll.
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
C=length(unique(A(:,end)))-1;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(1,3) = beta(1);
table10(2,3) = se(1,1); %robust standard error
table10(3,3) = C+1; %number of countries

%Col 4
A = [logmaddpop loglife20new compsjmhatit cd8 cd13 cd19 cd28...
cd38 cd39 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 ctry]; % some cd and yr2000 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000) & startrich~=1, :); 
B = [A(:, 3:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-1;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(1,4) = beta(1);
table10(2,4) = se(1,1); %robust standard error
table10(3,4) = C+1; %number of countries

%Col 5
A = [logmaddpop loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28...
cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(1,5) = beta(1);
table10(2,5) = se(1,1); %robust standard error
table10(3,5) = C+2; %number of countries

%Panel B: Dependent Variable: Log Total Births
%Col 1 
A = [logtotalbirths loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19...
cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(5,1) = beta(1);
table10(6,1) = se(1,1); %robust standard error
table10(7,1) = C+2; %number of countries

%Col 2
A = [logtotalbirths loglife20new compsjmhatit cd8 cd13 cd19...
cd38 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28 & startrich~=1, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(5,2) = beta(1);
table10(6,2) = se(1,1); %robust standard error
table10(7,2) = C+2; %number of countries

%Col 3
A = [logtotalbirths loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19...
cd35 cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd183 cd189 cd201 cd202 cd205 yr1940 yr1990 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1990) & ctry~=28, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(5,3) = beta(1);
table10(6,3) = se(1,1); %robust standard error
table10(7,3) = C+2; %number of countries

%Col 4
A = [logtotalbirths loglife20new compsjmhatit cd8 cd13 cd19...
cd38 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd149...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr1990 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1990) & startrich~=1 & ctry~=28, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(5,4) = beta(1);
table10(6,4) = se(1,1); %robust standard error
table10(7,4) = C+2; %number of countries

%Col 5
A = [logtotalbirths loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19...
cd36 cd38 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & ctry~=28, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(5,5) = beta(1);
table10(6,5) = se(1,1); %robust standard error
table10(7,5) = C+2; %number of countries

%Panel C: Dependent Variable: Log GDP
%Col 1 
A = [logtotalmaddgdp loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28...
cd35 cd36 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(9,1) = beta(1);
table10(10,1) = se(1,1); %robust standard error
table10(11,1) = C+2; %number of countries

%Col 2
A = [logtotalmaddgdp loglife20new compsjmhatit cd8 cd13 cd19 cd28...
cd38 cd39 cd43 cd46 cd58 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & startrich~=1, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(9,2) = beta(1);
table10(10,2) = se(1,1); %robust standard error
table10(11,2) = C+2; %number of countries

%Col 3
A = [logtotalmaddgdp loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19...
cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr2000 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(9,3) = beta(1);
table10(10,3) = se(1,1); %robust standard error
table10(11,3) = C+2; %number of countries

%Col 4
A = [logtotalmaddgdp loglife20new compsjmhatit cd8 cd13 cd19 cd28...
cd38 cd39 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr2000 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000) & startrich~=1, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(9,4) = beta(1);
table10(10,4) = se(1,1); %robust standard error
table10(11,4) = C+2; %number of countries

%Col 5
A = [logtotalmaddgdp loglife20new globmort1000 cd8 cd12 cd13 cd16 cd19 cd28...
cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(9,5) = beta(1);
table10(10,5) = se(1,1); %robust standard error
table10(11,5) = C+2; %number of countries

%Panel D: Dependent Variable: Log per capita GDP
%Col 1 
A = [loggdppcmadd loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19 cd28...
cd35 cd36 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(13,1) = beta(1);
table10(14,1) = se(1,1); %robust standard error
table10(15,1) = C+2; %number of countries

%Col 2
A = [loggdppcmadd loglife20new compsjmhatit cd8 cd13 cd19 cd28...
cd38 cd39 cd43 cd46 cd58 cd64 cd66 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sample80==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980) & startrich~=1, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(13,2) = beta(1);
table10(14,2) = se(1,1); %robust standard error
table10(15,2) = C+2; %number of countries

%Col 3
A = [loggdppcmadd loglife20new compsjmhatit cd8 cd12 cd13 cd16 cd19...
cd28 cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd64 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd147 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr2000 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(13,3) = beta(1);
table10(14,3) = se(1,1); %robust standard error
table10(15,3) = C+2; %number of countries

%Col 4
A = [loggdppcmadd loglife20new compsjmhatit cd8 cd13 cd19 cd28...
cd38 cd39 cd43 cd46 cd58 cd61 cd64 cd66 cd78 cd81 cd86 cd90 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd149 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd189 cd201 cd205 yr1940 yr2000 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==2000) & startrich~=1, :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2; % number of clusters
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(13,4) = beta(1);
table10(14,4) = se(1,1); %robust standard error
table10(15,4) = C+2; %number of countries

%Col 5
A = [loggdppcmadd loglife20new globmort1000 cd8 cd12 cd13 cd16 cd19 cd28...
cd35 cd36 cd38 cd39 cd43 cd46 cd51 cd55 cd58 cd61 cd66 cd70 cd78 cd81 cd86 cd92... 
cd93 cd98 cd108 cd116 cd127 cd132 cd141 cd148 cd149 cd151 cd153...
cd154 cd155 cd156 cd162 cd163 cd176 cd183 cd189 cd201 cd202 cd205 yr1940 yr1980 ctry]; % some cd and yr1980 variables are excluded due to coll.
A=A(sum(A,2)~=inf & sample40==1 & sjbasesamplenoncomm==1 & (year==1940 | year==1980), :); 
B = [A(:, 3:end-2) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,2); % First Stage
estllexp=B*beta; %estimated loglifeexpect
A = [A(:,1) estllexp A(:,4:end-2) A(:,end)];
B = [A(:, 2:end-1) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1); %second stage
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=length(unique(A(:,end)))-2;
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B))*((N-1)/(N-K))*(C/(C-1));
table10(13,5) = beta(1);
table10(14,5) = se(1,1); %robust standard error
table10(15,5) = C+2; %number of countries

%Panel E: Dependent Variable: Log life expectancy at 20
%Col 1 
A = [loglife20new compsjmhatit yr1940 yr1980];
A0 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & year==1940,:);
A1 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = A(:,2:3);
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=N-2;
mA = mean(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table10(17,1) = beta(1);
table10(18,1) = se(1,1); %robust standard error
table10(19,1) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table10(20,1) = N; %number of countries

%Col 2 
A = [loglife20new compsjmhatit yr1940 yr1980];
A0 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & startrich~=1 & year==1940,:);
A1 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & startrich~=1 & year==1980,:);
A = A1-A0; %long difference
B = A(:,2:3);
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=N-2;
mA = mean(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table10(17,2) = beta(1);
table10(18,2) = se(1,1); %robust standard error
table10(19,2) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table10(20,2) = N; %number of countries

%Col 3
A = [loglife20new compsjmhatit yr1940 yr2000];
A = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & sample40==1 & (year==1940 | year==2000),:);
%A1 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & sample40==1 & year==2000,:);
%A = A1-A0; %long difference
B = [A(:,2:3) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1))/2;
K=length(B(1,:));
C=N-2;
mA = mean(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table10(17,3) = beta(1);
table10(18,3) = se(1,1); %robust standard error
table10(19,3) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table10(20,3) = N; %number of countries

%Col 4
A = [loglife20new compsjmhatit yr1940 yr2000];
A = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1) & (year==1940 |year==2000)& startrich~=1,:);
%A1 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1) & year==2000& startrich~=1,:);
%A = A1-A0; %long difference
B = [A(:,2:3) ones(length(A(:,1)),1)];
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1))/2;
K=length(B(1,:));
C=N-2; % number of clusters
mA = mean(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table10(17,4) = beta(1);
table10(18,4) = se(1,1); %robust standard error
table10(19,4) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table10(20,4) = N; %number of countries

%Col 5
A = [loglife20new globmort1000 yr1940 yr1980];
A0 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & year==1940,:);
A1 = A(sum(A,2)~=inf & sjbasesamplenoncomm==1 & (sample40==1 & sample80==1) & year==1980,:);
A = A1-A0; %long difference
B = A(:,2:3);
beta = inv(B'*B)*B'*A(:,1);
e=A(:,1)-B*beta;
N=length(A(:,1));
K=length(B(1,:));
C=N-2; % number of clusters
mA = mean(A(:,1));
se=sqrt(inv(B'*B)*B'*diag(diag(e*e'))*B*inv(B'*B)*((N-1)/(N-K))*(C/(C-1)));
table10(17,5) = beta(1);
table10(18,5) = se(1,1); %robust standard error
table10(19,5) = ((B*beta-mA)'*(B*beta-mA))/((A(:,1)-mA)'*(A(:,1)-mA));
table10(20,5) = N; %number of countries


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%End of Table 10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlswrite('tables.xls', table2, 2, 'B2');
xlswrite('tables.xls', table3, 3, 'B2');
xlswrite('tables.xls', table4, 4, 'B2');
xlswrite('tables.xls', table5, 5, 'B2');
xlswrite('tables.xls', table6, 6, 'B2');
xlswrite('tables.xls', table7, 7, 'B2');
xlswrite('tables.xls', table8, 8, 'B2');
xlswrite('tables.xls', table9, 9, 'B2');
xlswrite('tables.xls', table10, 10, 'B2');
% 
% dlmwrite('table2.txt',table2,'delimiter','\t','precision','%.6f');
% dlmwrite('table3.txt',table3,'delimiter','\t','precision','%.6f');
% dlmwrite('table4.txt',table4,'delimiter','\t','precision','%.6f');
% dlmwrite('table5.txt',table5,'delimiter','\t','precision','%.6f');
% dlmwrite('table6.txt',table6,'delimiter','\t','precision','%.6f');
% dlmwrite('table7.txt',table7,'delimiter','\t','precision','%.6f');
% dlmwrite('table8.txt',table8,'delimiter','\t','precision','%.6f');
% dlmwrite('table9.txt',table9,'delimiter','\t','precision','%.6f');
% dlmwrite('table10.txt',table10,'delimiter','\t','precision','%.6f');