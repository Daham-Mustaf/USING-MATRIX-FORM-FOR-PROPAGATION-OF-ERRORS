%%%%% Author Daham Muhammed
%%% Error propagation - Lidar accuracy:
clc,clear

% given: point coordinates and accuracy
% Standard Error in Scanning Range = 20m ± 2cm
% Standard Error in Azimuth angle=45± 0.05.
% Standard Error in Vertical angle = 12.83 ± 0.05.
% syms is to define the variables
%set up measuered quantities  
syms R A V

% the vecor of measurment 
l=[A V R ]';

% formulate the parameters in terms of the observations.
% equation has one parameter (x) as a subject.
% Each equation will involve some or all of the observations (with a possibility of some
% constant values being present),
% but no other unknown parameters must be found in the equation so as to
% satisfy x = f(l) model.
X =R*cos(A)*cos(V);
Y =R*sin(A)*cos(V);
Z =R*sin(V);

% Taylor Series Expansion of Model Equations
% Linearize the observation equations and substitute x0 values We get the Jacobian metrix F;
% the functions are nonlinear, a first-order Taylor series expansion can be used to linearize
% jacobian([functions as ;], [measuere (unrelated) quantities]) J is a
% matix of size (m,n);
J=jacobian([X;Y;Z],[A V R]);

% Form the first design matrix, A, substitute measured values We get the Jacobian metrix F;
% if there is any angle of dgree unit must be converted to its equivalent radian value to achieve
% agreement in the units.
A=45*pi/180;
V=12.83*pi/180;
R=20;
F=eval(J);

% the vector of Unknonw paramiters 
X_=[X, Y, Z]';
R=length(l)- length(X_);
% the value of the equation 
result = eval([X,Y,Z]); % m
save('result.txt','result', '-ascii')
 
% compute the sigma of measurment 
Std_ll=[(.05*pi/180)^2; (.05*pi/180)^2; .02^2 ];    % vector of standard deviations trnasfer dgree to radian
Sigma_ll= diag(Std_ll);                   % variances covariances matrix of measurment.
 save('Sigma_ll.txt', 'Sigma_ll', '-ascii')

% law of propagation of variances (SLOPOV). 
% #################
Sigma_X_Y_Z=F*Sigma_ll*F'; %Unit 
save('Sigma_X_Y_Z.txt', 'Sigma_X_Y_Z', '-ascii')

% standard deviation in the 
% the squer root of diagonal for Sgma(Sigma_X_Y_Z) is a standard deviation
% of the estimated parramiters.
ST_X_Y_Z=[sqrt(Sigma_X_Y_Z(1,1)); sqrt(Sigma_X_Y_Z(2,2))];  % M 
save('ST_X_Y_Z.txt', 'ST_X_Y_Z', '-ascii')
 
% Note that the off-diagonal of (Sigma_##_##) is not equal to zero, and thus Xb Yb correlated
% Correlation computation only shows measures linear relationships. 
% A correlation coefficient of zero does not necessarily mean zero
% relationship between the two tested variables; it only means that the two variables have zero linear relationship
%X_Y_Z=ST_X_Y_Z(1,2)/ sqrt(ST_X_Y_Z(1,1))*sqrt(ST_X_Y_Z(2,2));


