% pure_death_process genData file
%
%   Using the function pure_death and pure_death_density we obtain 2 
%   data sets. 
%
%   First data set contains data to show a few realizations.
%
%   Second data set contains data for the density plot of the realizations.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death_process
%
% tranht (June 15, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Realizations

N = 100;
c = 1;
numTrials = 10;
t = zeros(N+1, numTrials);

fprintf('Realizations ...\n');
tic
for i=1:numTrials
    [t(:,i) X] = pure_death(N, c);
end
toc

save('data/data_1.mat', 'N', 'c', 't', 'X');

%--------------------------------------------------------------------------
% Realizations

j = 10000;
tfinal = 6.5;
m = 100;

fprintf('Density ...\n');
tic
[t, X, D, mean_, e] = pure_death_density(N, c, j, tfinal, m);
toc

save('data/data_2.mat', 't', 'X', 'D', 'e', 'mean_');
