% pure_death_density_tauf
%
%   [t Xaxis D mean_] = pure_death_density_tauf(N, c, j, tfinal, L)
%       Returns a vector of times and states for the exact stochastic
%       simulation algorithm in a pure-death process. Here N denotes the
%       initial number of molecules and c is the rate constant. j is the
%       number of trials. L is a number of time bins. 
% Note: tau is fixed for each step in this process
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death
%
% tranht (June 17, 2012)
% Department of Mathematics
% University of Houston

    
function[t Xaxis D mean_]=pure_death_density_tauf(N,c,j, tfinal,L)
tau=tfinal/L;
t=[0:tau:tfinal];
Xaxis = 0:N;
D = zeros(N+1, L+1);
mean_ = zeros(size(t));

	A=zeros(L+1, j);
    for r=1:j
    X=N;           %Initial number of molecules X0
    Xvals(1) = X;
    %For loop to implement tau-leaping algorithm
    for i=1:L
        a=c*X;
        X=X-poissrnd(tau*a);
        Xvals(i+1)=X;
    end
    A(:,r)=Xvals;
    end
    for k=1:L+1
    [e, heights] = histogram(A(k,:), 'Discrete', 'PDF', {[0 N]});
    D(:,k)=heights;
	mean_(k) = mean(A(k,:));
    end
 %pcolor(t,Xaxis,D);
 %colormap(bone); hold on;
 %plot(t, mean_,'r');
 %plot(t, 100*exp(-t),'green', 'LineWidth',2);
end 
    

    
   