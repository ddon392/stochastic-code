%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Michaelis-Menten system, Gillespie's algorithm      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function to plot the graph of the state of the
%Michaelis-Menten system as time evovles
%Input: S:initial number of substrate
%       E:initial number of enzyme
%       c1, c2,c3 are rate constants
%Output: vector time and matrix X, number of molecules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Hong Tran, June 17, 2012

function[tvals Xvals]=MM_simpleSSA(S,E, c1, c2,c3)
    %rand('state',100)  %Make sure to get the same result for every run
    V=[-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];
    %%%Parameters and Initial Conditions
    X=zeros(4,1);      %Initialize state vector
    X(1)=S; X(2)=E;
    c(1)=c1; c(2)=c2;c(3)=c3;
    t=0;
    i=1;               %Index to keep track of time and state vector
        while X(1)>0
        a(1)=c(1)*X(1)*X(2);
        a(2)=c(2)*X(3);
        a(3)=c(3)*X(3);
        asum=sum(a);
        j=min(find(rand<cumsum(a/asum)));
        tau=-log(rand)/asum;
        X=X+V(:,j);
        t=t+tau;
        Xvals(:,i)=X;
        tvals(i)=t;
        i=i+1;
        end 
    %Presentation of the plot    
    %figure(1);hold on
    %plot(tvals,Xvals(1,:),'go--')
    %plot(tvals,Xvals(4,:),'r*-')
	%plot(tvals, Xvals(2,:), 'LineWidth', 2);
	%plot(tvals, Xvals(3,:), 'b','LineWidth', 2);  
end 