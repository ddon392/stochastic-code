%----------------------------------------------------------%
%  Tau-leaping to accelerate SSA in a pure-birth process   %
%----------------------------------------------------------%
%                                                          %
% This function is to demonstrate SSA with tau-leaping.    %
% tau varies according to the vector state                 %
% Input: c-the rate of a process, X0-initial number of     %
% molecules.                                               %
% Output: Xvals-number of molecules at time tvals          %
%----------------------------------------------------------%
%Hong Tran

function[tvals Xvals]=birth_tauleapingv(X0, c);
X=X0;
i=1;    %index to keep track of Xvals and tvals
t=0;    %initial time
e=0.03; %bounded value for propensity a
tvals(1)=t;
Xvals(1)=X;
while X<=101
 a=c*X;
 tau=min((max(e*X,1)/a),((max(e*X,1))^2/a));
 t=t+tau;
 X=X+poissrnd(tau*a);
 i=i+1;
 tvals(i)=t;
 Xvals(i)=X;
end
 stairs(tvals, Xvals, 'red');
 
 
    

