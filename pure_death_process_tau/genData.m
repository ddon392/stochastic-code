%
%   Using the function densitytau we obtain a
%   data set. 
%
%   Data set contains data for the density plot of the realizations.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death_process
%
% tranht (June 15, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Density

j = 1000;
tfinal = 6.5;
L=100;
c=1;
N=100;

fprintf('Density_tau ...\n');
tic
[t Xaxis D mean_]=pure_death_density_tau(N,c,j, tfinal,L);
toc

save('data/data_1.mat', 't', 'Xaxis', 'D', 'mean_');



