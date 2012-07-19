% pure_birth_process with tau leaping genData file
%
%   Using the function pure_birth_tauf_avg and birth_histogram we obtain 2 
%   data sets. 
%
%   The first data contains the time vector and the average values from 1000 
%   simulations.
%   The second data contains X values from different simulation at specific
%   time.
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
tfinal=6.5;
L=250;
R=1000;
fprintf('Realizations ...\1');
tic
[t mean_ A]=pure_birth_tauf_avg(X0, c,tfinal, L, R);
toc
save('data\data1', 't', 'mean_', 'X0', 'L', 'R', 'tfinal', 'A');
%--------------------------------------------------------------------------
%Realizations
time=1.69;
R=1000;
fprintf('Realizations ...\2');
tic
[Xfinal]=birth_histogram(X0, c, time, R)
toc
save('data\data2', 'Xfinal', 'X0', 'time', 'R');

