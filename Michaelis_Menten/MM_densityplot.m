%---------------------------------------------------------------%
%This function is to plot the density                           %
%of MM system.                                                  %
%Input: S-initial number of substrate, E-initial number of      %
%enzyme, c1, c2, c3 are rate constant, R-number of simulations  %
%trange-time interval                                           %
%Output: densityplot                                            %
%---------------------------------------------------------------%
%Hong Tran, June 17th, 2012

function[]=MM_densityplot(S, E, c1, c2, c3, R, trange)

    index=1;                %to keep track of number of time bin
    for tfix=trange(1):1.1:trange(2) %[2 70]
    Sfinal=zeros(R,1);      %R=1000
    for r=1:R       %number of runs
    V=[-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];
    %%%Parameters and Initial Conditions
    X=zeros(4,1);      %Initialize state vector
    X(1)=S; X(2)=E;
    c(1)=c1;c(2)=c2;c(3)=c3;
    t=0;
    i=1;               %Index to keep track of time and state vector
   
        while X(1)>0
        a(1)=c(1)*X(1)*X(2);
        a(2)=c(2)*X(3);
        a(3)=c(3)*X(3);
        asum=sum(a);
        j=min(find(rand<cumsum(a/asum)));
        tau=log(1/rand)/asum;
        X=X+V(:,j);
        t=t+tau;
        Xvals(:,i)=X;
        tvals(i)=t;
        i=i+1;
        end 
        
    k=max(find(tvals<tfix));
    Sfinal(r)=Xvals(1,k);  %for Substrates
    %Pfinal(r)=Xvals(4,k); %for Products
    end
    
    [x y dt]=density(Sfinal,[0 S],S);
    Pdens(:,index)=y;               %Matrix with columns are Sfinals at different tfix
    index=index+1;                  %increment index
   
   end
   %Present the densityplot
   pcolor(Pdens)
   colormap(bone)
end 
 