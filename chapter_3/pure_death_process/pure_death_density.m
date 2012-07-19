% pure_death_density
%
%   [t X D] = pure_death_density(N, c, j, tfinal, m)
%       Returns a vector of times and states for the exact stochastic
%       simulation algorithm in a pure-death process. Here N denotes the
%       initial number of molecules and c is the rate constant. j is the
%       number of trials.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death
%
% tranht (June 17, 2012)
% Department of Mathematics
% University of Houston


function [t, X, D, mean_, e] = pure_death_density(N, c, j, tfinal, m)
index=1;         %to keep track of number of time bin

t = linspace(0, tfinal, m+1);
dt = t(2)-t(1);
t = t(1:end-1)+dt/2; 
X = 0:N;
D = zeros(N+1, m);
mean_ = zeros(size(t));
for tfix=t
    A=zeros(N+1,j+1);
    A(:,1)=(N:-1:0);      %each timestep number of molecules reduce by 1
    tau=log(1./rand(N,j))./repmat(c*A(1:N,1),[1 j]);  %random time interval between 2 events
    A(2:N+1,2:j+1)=cumsum(tau); %time at which a reaction takes place
    
    Xfinal = zeros(j, 1);
    for i=2:j+1
        k=find(tfix>A(:,i), 1, 'last' );
        Xfinal(i)=A(k,1);
    end
    [e, heights] = histogram(Xfinal, 'Discrete', 'PDF', {[0 N]});
    mean_(index) = mean(Xfinal);
    D(:,index) = heights; % Matrix with columns are Xfinals at different tfix
    index=index+1;        % Increment index
end

end
