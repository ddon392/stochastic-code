% pure_death_tauv
%
%   [tfix mean_ lengthmean] = pure_death_tauv(N, c, j, tfinal)
%       Returns a vector of times and average states and number of time steps 
%       for the tau leaping algorithm in a pure-death process. Here N denotes the
%       initial number of molecules and c is the rate constant, j is the
%       number of simulations. 
% Note: tau varies for each step in this process and depends on the
% state vectors.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death
%
% tranht (June 17, 2012)
% Department of Mathematics
% University of Houston

    
function[tfix mean_ lengthmean]=pure_death_tauv(N,c,j,tfinal);
index=1;
tfix=[0.1:0.1:tfinal];
for time=tfix
    for r=1:j
	X=N;           %Initial number of molecules X0       
    i=1;    %index to keep track of vector time t and Xt
    t=0;
    tvals(1) = t;
    Xvals(1) = X;
    e=0.05;  %bounded value for propensity
    %While loop to implement tau-leaping algorithm
    while X>0
        a=c*X;
        tau=min((max(e*X,1)/a),((max(e*X,1))^2/a));
        t=t+tau;
        X=X-poissrnd(tau*a);
        i=i+1;
        tvals(i)=t;
        Xvals(i)=X;
    end
     k=max(find(tvals<time));
     Xfinal(r)=Xvals(k);
     lengthtime(r)=length(tvals);
    end
    mean_(index)=mean(Xfinal);
    lengthmean(index)=mean(lengthtime);
    index=index+1;   
 end

% plot(tfix, mean_,'r', 'LineWidth', 2);hold on;
% plot(tfix, N*exp(-tfix),'g', 'LineWidth', 2);
 
end 
    

    
   