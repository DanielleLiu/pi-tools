function [outlierIndx]=detectOutliers(y,x,P,C,R)
m=length(y);
expY=C*x;
Py=C*P*C' + R;
innov=y-expY;
logp=-innov'*pinv(Py)*innov; %1/2 of log(p) of observation
auxTh=-(th+m*log(2*pi*det(Py)));
auxLogP=pinv(obsUncertainty)*innov;
outlierIndx=auxLogP> (auxTh./innov); %Values of 1 indicate likely outliers

%ALT: do it recursively by finding the lowest log(p), if it passes the threshold
%exclude it, then re-compute log(p) without considering it, find the second lowest
%value, and so forth.

end
