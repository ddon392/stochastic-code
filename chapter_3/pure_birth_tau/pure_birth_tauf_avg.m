% pure_birth_tauf_avg
%
%   [t mean_ A]=pure_birth_tauf_avg(X0,c, tfinal, L, R)
%       Returns a vector of times and states and matrix A with columns are
%       corresponding to state vectors for the SSA with tau leaping
%       in a pure-birth process. Here X0 denotes the
%       initial number of molecules and c is the rate constant, tfinal is
%       the end of the time period, L is the time bin and R is the number
%       of simulations.
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_birth_tau
%
% tranht (June 17, 2012)
% Department of Mathematics
% University of Houston
function[t mean_ A]=pure_birth_tauf_avg(X0,c, tfinal, L, R)
    tau=tfinal/L;
    t=0:tau:tfinal;
    A=zeros(L+1, R);
    for r=1:R
    X=X0;           %Initial number of molecules X0
    Xvals(1) = X;
    %For loop to implement tau-leaping algorithm
    for i=1:L
        a=c*X;
        X=X+poissrnd(tau*a);
        Xvals(i+1)=X;
    end
    A(:,r)=Xvals;
    end
    for k=1:L+1
	mean_(k) = mean(A(k,:));
    end
    
   % plot(t, mean_, 'r', 'LineWidth', 2); hold on;
   % plot(t, X0*exp(t), 'b', 'LineWidth', 2); 
end