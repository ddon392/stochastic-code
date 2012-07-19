%----------------------------------------------------------%
%  Tau-leaping to accelerate SSA in a pure-death process   %
%----------------------------------------------------------%
%                                                          %
% This function is to demonstrate SSA with varied tau-leap %
% Input: N-initial number of molecules, c-the rate of      %
% a process,                                               %
% Output: Xvals-number of molecules at time tvals          %
%----------------------------------------------------------%
%Hong Tran

 function[Xvals tvals]=tauleapingv(N,c)
    X=N;           %Initial number of molecules X0       
    i=1;    %index to keep track of vector time t and Xt
    t=0;
    tvals(1) = t;
    Xvals(1) = X;
    e=0.03;  %bounded value for propensity
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
    stairs(tvals,Xvals,'green','LineWidth',2)
    hold on
 end
    