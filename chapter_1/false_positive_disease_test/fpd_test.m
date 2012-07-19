% fpd_test
%
%   ratio = fpd_test(p_disease, p_false_pos, N)
%       Returns the fraction of all those patients that are sick out of the
%       ones that tested positive given the probability of of a person
%       having the disease, the probability that a test gives a false
%       positive and the number of patients that get tested.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=1#false_positive_disease_test
%
% josic (May 30, 2012)
% Department of Mathematics
% University of Houston

function ratio = fpd_test(p_disease, p_false_pos, N)

vector1 = rand(N,1);                  % Vector of uniformly distributed 
                                      % random variables.
patient_status = vector1 < p_disease; % Only those the threshold value of 
                                      % 1 - p.

vector2 = rand(N,1);                  % Create another random vector for 
                                      % test outcomes
test_outcome = vector2 < p_false_pos; % These are the false positive 
                                      % outcomes - see also below.

outcomes = test_outcome | patient_status; % The symbol | is an 'or' 
                                          % opearator. Therefore we get a 
                                          % 1 every time the patient is 
                                          % either sick or has a positive 
                                          % outcome on the test.
                                          
total_sick = sum(patient_status); % Sum up all the patients that are 
                                  % actually sick.
positive = sum(outcomes);         % Sum up all the tests that are positive.

ratio = total_sick/positive; % Obtain result.
                                       