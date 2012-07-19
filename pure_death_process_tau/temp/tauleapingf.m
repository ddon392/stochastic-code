%----------------------------------------------------------%
%  Tau-leaping to accelerate SSA in a pure-death process   %
%----------------------------------------------------------%
%                                                          %
% This function is to demonstrate SSA with tau-leaping.    %
% Input: N-initial number of molecules, c-the rate of      %
% a process, L: number of tau bins, tfinal-time            %
% Output: Xvals-number of molecules at time tvals          %
%----------------------------------------------------------%
%Hong Tran

 function[Xvals tvals]=tauleapingf(N,c, tfinal, L)
    X=N;           %Initial number of molecules X0       
    i=1;           %index to keep track of vector time t and Xt
    tvals(1) = 0;
    Xvals(1) = X;
    tau=tfinal/L;  %tau<=0.03 
    
    %For loop to implement tau-leaping algorithm
    for k=1:L
        a=c*X;
        X=X-poissrnd(tau*a);
        Xvals(k+1)=X;
    end
    tvals = [0:tau:tfinal];
    plot(tvals,Xvals,'green','LineWidth',2)
    hold on
 end
    