% rand_walk
%
%   post = rand_walk(N, steps)
%       This function generates N random walks, each of which is "steps" time-steps long. The output is a matrix
%		whose ijth entry is the ith walker's position at time-step j.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=1#random_walk
%
% josic (June 2012)
% Department of Mathematics
% University of Houston

function post = rand_walk(N,steps)

moves1 = rand([N,steps]);      % We will generate random walks
moves  = 2*(moves1 > 0.5) - 1; % Make an entry in the vector moves1 +1 or -1  
                               % with equal probability
post = zeros(N,steps);         % vector of positions

post(:,1) = zeros(1,N);

for i = 1:steps;                                     
    post(:,i+1) = post(:,i) + moves(:,i);
end
