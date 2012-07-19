%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Euler-Maruyama simulation of CLE    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hong Tran
  
%Parameter and initial conditions
 tfinal=9;
 L=300;
 tau=tfinal/L; %stepsize
 Y=100;
 Yvals(1)=100;
 c=1;
	
 %For loop to increment CLE algorithm 
 for k=1:L
 a=c*Y;
 d=tau*a+sqrt(abs(tau*a))*randn;
 Y=Y-c*d;
 Yvals(k+1)=Y;
 end
    
 %Plot the graph
 tvals = [0:tau:tfinal];
 plot(tvals,Yvals,'green','LineWidth',2)
 axis([0 6.5 0 100])
 xlabel('Time','FontSize',14)
 ylabel('Molecules','FontSize',14)
 title('Euler-Maruyama simulation of the CLE','FontSize',14)
 grid on