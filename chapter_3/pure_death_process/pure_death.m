% pure_death
%
%   [t X] = pure_death(N, c)
%       Returns a vector of times and states for the exact stochastic
%       simulation algorithm in a pure-death process. Here N denotes the
%       initial number of molecules and c is the rate constant.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death
%
% tranht (June 17, 2012)
% Department of Mathematics
% University of Houston

function [t X] = pure_death(N, c)

A = zeros(N+1,2);
A(:,1)=(N:-1:0);   % Each timestep number of molecules is reduced by 1.
tau=log(1./rand(N,1))./(c*A(1:N,1));  % Random time interval between 2 events
A(2:N+1,2)=cumsum(tau);
X=A(:,1);
t=A(:,2);

end