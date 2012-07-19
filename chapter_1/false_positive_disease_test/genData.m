% false_positive_disease_test genData file
%
%   Using the function fpd_test we obtain two data sets. 
%
%   In the first data set we fix the probability of disease and vary the 
%   number of patients. This is done several times to show the variability 
%   of the different outcomes.
%
%   In the second data set we fix the number of patients and we vary the
%   probability of disease.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=1#false_positive_disease_test
%
% jmlopez (May 30, 2012)
% Department of Mathematics
% University of Houston

function genData
%--------------------------------------------------------------------------
% Varying sample size.
fprintf('Varying sample size...\n\n');

% Parameters
p_disease = 1e-4;
p_false_pos = 1e-2;
num_N = 30;
num_trials = 60;
fprintf('num_trials = %d, num_N = %d\n', num_trials, num_N);

% Main Computation
N = linspace(1e5, 1e7, num_N);
ratio = zeros(num_N, num_N);
tic;
for t=1:num_trials
    for n=1:num_N
        ratio(t, n) = fpd_test(p_disease, p_false_pos, floor(N(n)));
    end
end
toc
save('data/data_1.mat', 'N', 'ratio');

%--------------------------------------------------------------------------
% Varying probability of disease
fprintf('\nVarying probability of disease...\n\n');

% Parameters
num_points = 30;
N = 1e6;
fprintf('num_points = %d\n', num_points);

% Main Computation
p_disease = linspace(0.0001, 0.01, num_points);
ratio = zeros(num_points, 1);
tic;
for i=1:num_points
   ratio(i) = fpd_test(p_disease(i), p_false_pos, N);
end
toc
save('data/data_2.mat', 'p_disease', 'ratio');
