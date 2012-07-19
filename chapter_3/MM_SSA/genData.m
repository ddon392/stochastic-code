% Stochastic Simulation in Michaelis Menten System genData file
%
%   Using the function MM_SSA_avg and we obtain 2 
%   data sets. 
%
%   The first data contains the time vector and the average values from 1000 
%   simulations.
%   The second data contains X values from different simulation at specific
%   time.
%   
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_birth_tau
%
% tranht (June 15, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Realizations
X1 = 200;
X2=100;
c1 = 1.5*10^-3;
c2=10^-4;
c3=0.1;
R=1000;
tfinal=50;
fprintf('Realizations ...\1');
tic
[tfix Xavg1 Xavg2 Xavg3 Xavg4 error1 error2 error3 error4 lengthavg ]=MM_SSA_avg(X1, X2, c1, c2,c3, R, tfinal); 
toc
save('data\data1', 'tfix', 'Xavg1', 'Xavg2', 'Xavg3', 'Xavg4', 'tfinal', 'R', 'error1', 'error2', 'error3', 'error4', 'lengthavg');


