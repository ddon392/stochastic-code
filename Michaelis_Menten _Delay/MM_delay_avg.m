   index=1;
   tfix=1:1:50;
   for time=tfix
   for r=1:1000
    %Parameters
    c(1)=1.5e-3;
    c(2)=1e-4;
    c(3)=0.1;
    
    %Simulation parameters
    a = zeros(3, 1);
    dv = zeros(3, 1);
    V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];    %state change vector
    
    %Allocating memory 
    
    X = zeros(4, 1);
    
    i = 1;                  %index to keep track of tv and xv
    list = dlList;          %Name of Arraylist to store delayed time and reactions
    
    %Set up
    t = 0;
    X(1) =200;              %Initial number of molecules is 200;
    X(2)=100;
    tvals(1)=0;
    Xvals=zeros(4,1);
    Xvals(1,1)=X(1);
    Xvals(2,1)=X(2);
    
    %Simulation
    while t<50
        a(1)=c(1)*X(1)*X(2);
        a(2)=c(2)*X(3);
        a(3)=c(3)*X(3);
        asum=sum(a);
        %Eval delay
        tau=log(1/rand)/asum;
        nextt = inf;
        if list.fill > 0
           nextt = fire(list) - t;     
        end
        
        if tau<nextt
            t = t + tau;   %update time
            %what reaction will occur?
            j=min(find(rand<cumsum(a/asum)));
            dv(j)=2+rand;
            %Is the event delayed?
            if dv(j) > 0
              list = add(list, t+dv(j), j); %delay, update the list
            else
              X = X+V(:, j);   %no delay, update state vector
            end
        else 
            [firetime rxn]=fire(list);
            X=X+V(:,rxn);
            t=firetime;
            list=remove(list);
        end
     i=i+1;
     tvals(i)=t;      %there are some weird more t added to the end 
     Xvals(:,i)=X;
    end
     k=max(find(tvals(1:i)<time));
     Xfinal(:,r)=Xvals(:,k);
     lengthtime(r)=i;
    end
    Xavg1(index)=mean(Xfinal(1,:));
%     Xavg2(index)=mean(Xfinal(2,:));
%     Xavg3(index)=mean(Xfinal(3,:));
    Xavg4(index)=mean(Xfinal(4,:));
    stepavg(index)=mean(lengthtime);
    index=index+1;
   end
  % plot(tfix, Xavg1, 'r', 'LineWidth',2);hold on;
%   plot(tfix, Xavg2, 'black', 'LineWidth', 2);
%    plot(tfix, Xavg3, 'blue', 'LineWidth', 2);
  % plot(tfix, Xavg4, 'g', 'LineWidth', 2);
save('MM_delay_avgr1000t50.mat','tfix','Xavg1','Xavg4','stepavg');