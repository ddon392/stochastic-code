% pure_birth_process genData file
%
%   Using the function pure_birth and pure_birth_avgX we obtain 2 
%   data sets. 
%
%   First data set contains data to show a few realizations.
%
%   Second data set contains data for the average plot and the standard
%   deviation plot of the realizations and the histogram at specific time.
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_birth_process
%
% tranht (June 15, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Realizations

X0 = 1;
c = 1;
numTrials = 10;


fprintf('Realizations ...\n');
tic
for i=1:numTrials
    [t(:,i) X] = pure_birth(X0, c);
end
toc

save('data/data_1.mat', 'X0', 'c', 't', 'X');

%--------------------------------------------------------------------------
% Realizations

fprintf('Density ...\n');
tic
[tfix Xavg error e D]=pure_birth_avgX(X0, c);
toc

save('data/data_2.mat', 'tfix', 'Xavg', 'D', 'e', 'error');

