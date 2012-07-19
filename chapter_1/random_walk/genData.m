% random_walk genData file
%
%   Using the function rand_walk we obtain 2 data sets. 
%
%   First data set contains data to show a few realizations.
%
%   Second data set contains data for the density of the random walkers
%   and data to create histograms of the positions of the walkers at a
%   given time.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=1#random_walk
%
% omarscha (June 15, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Realizations.

N = 10;
T = 60;

fprintf('Computing realizations ...\n');
tic;
R = rand_walk(N, T);
toc
save('data/data_1.mat', 'N', 'T', 'R');

%--------------------------------------------------------------------------
% Density and Histogram

N = 1e5;
T = 60;

fprintf('Computing density ...\n');
tic;
R = rand_walk(N, T);

% Find the minimum and maximum values among all of the walks to
% get a reasonable range for the histogram.
D = size(R);
L = reshape(R, 1, D(1)*D(2));
mxL = max(L);
mnL = min(L);
H = zeros(mxL-mnL+1, T+1);
Y = mnL:mxL;
for k=0:T
    [edges heights] = histogram(R(:,k+1), 'Discrete', 'PDF', {[mnL, mxL]});
    H(:,k+1) = heights;
end
toc

save('data/data_2.mat', 'R', 'N', 'T', 'H', 'Y');

