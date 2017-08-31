function [beta, cov_beta , J, omegahat]=fegmm(Y,X,Z,q)
%table_sargan = [];
disp('2-step feasible efficient GMM estimates');
N=length(Y);
ZZ=Z'*Z;
XZ=X'*Z;
ZZinv=inv(ZZ);
ZY=Z'*Y;
% Projection and annihilation matrices
PZ=Z*ZZinv*Z';
MZ=eye(N)-PZ;
% First-step ineff but consistent coeff estimates are IV
beta=inv(XZ*ZZinv*XZ')*XZ*ZZinv*ZY;
% Predicted values and residuals
Yhat=X*beta;
ehat=Y-Yhat;
% Sample moments
QZZhat=1/N*ZZ;
QZZhatinv=inv(QZZhat);
QZXhat=1/N*Z'*X;
% Covariance matrix of moment conditions
omegahat=zeros(length(Z(1,:)),length(Z(1,:)));
for i=1:N
omegahat=omegahat+ehat(i)^2*Z(i,:)'*Z(i,:);
end
omegahat=1/N*omegahat;
omegahatinv=inv(omegahat);
% Second-step efficient and consistent GMM estimator
beta=inv(XZ*omegahatinv*XZ')*XZ*omegahatinv*ZY;
% Covariance matrix of efficient root-N GMM estimator
cov_beta_rootN=inv(QZXhat'*omegahatinv*QZXhat);
cov_beta=1/N*cov_beta_rootN;
% Sample moment conditions
% Need moment conditions from new FEGMM estimator
% Predicted values
Yhat=X*beta;
% Residuals
ehat=Y-Yhat;
gbar=1/N*Z'*ehat;
% J statistic
J=N*gbar'*omegahatinv*gbar;
% Degrees of freedom
[r, L]=size(Z);
[r, K]=size(X);
Jdof=L-K;
Jpvalue=1-chi2cdf(J,Jdof);
% Standard errors, zstats, pvalues
se=sqrt(diag(cov_beta));
zstat=beta./se;
pvalue=2*(1-normcdf(abs(zstat)));
% disp('Sargan-Hansen J statistic');
% disp(J);
% disp('J degrees of freedom');
% disp(Jdof);
% disp('J p-value');
% disp(Jpvalue);
disp('...J_stat......Jdof.....Jpvalue')
table_sargan(q,:)=[J,Jdof,Jpvalue];
disp(table_sargan);
