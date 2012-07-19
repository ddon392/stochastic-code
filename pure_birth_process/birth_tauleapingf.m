%----------------------------------------------------------%
%  Tau-leaping to accelerate SSA in a pure-birth process   %
%----------------------------------------------------------%
%                                                          %
% This function is to demonstrate SSA with tau-leaping.    %
% Input: c-the rate of a process, L: number of tau bins,   %
% tfinal-time                                              %
% Output: Xvals-number of molecules at time tvals          %
%----------------------------------------------------------%
%Hong Tran

 function[Xvals tvals]=birth_tauleaping(X0, c, tfinal, L)     
    i=1;           %index to keep track of vector time t and Xt
    tvals(1) = 0;
    Xvals(1) = 0;
    tau=tfinal/L;  %tau<=0.03/tfinal=4.5 and L=200
    X=X0;
    %For loop to implement tau-leaping algorithm
    for k=1:L
        a=c*X;
        X=X+poissrnd(tau*a);
        Xvals(k+1)=X;
    end
    tvals = [0:tau:tfinal];
    plot(tvals,Xvals,'green','LineWidth',2)
    hold on
 end