%-----------------------------------------------------------------------%
%This function is to demonstrate exact Stochastic Simulation Algorithm  %
%in pure-birth-process.                                                 %
%Input: N:final number of molecules                                     %
%       c: rate constant                                                %
%Output:vector t-time at which the reaction takes place                 %
%       vector X-number of molecules at time t                          %
%-----------------------------------------------------------------------%           
%Hong Tran, June 21st, 2012

function[Svals tvals]=purebirthSSA(N, c)
A=zeros(N,2);
A(:,1)=(1:1:N);      %each timestep number of molecules increase by 1
tau=log(1./rand(N-1,1))./(c*A(1:N-1,1));  %random time interval between 2 events
A(2:N,2)=cumsum(tau);

%Presentation of the plot
tvals=A(:,2);
Svals = A(:,1);

%Plot multiple graph
figure(1); hold on; 
stairs(tvals,Svals,'red', 'Linewidth',2);
axis([0 6.5 0 100])
xlabel('t','FontSize',14)
ylabel('X(t)','FontSize',14)
set(gca,'FontWeight','Bold','FontSize',12)
grid on
end 