    %Parameters
    c(1)=1.5e-4;
    c(2)=1e-3;
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
    tvals(1)=t;
    Xvals=zeros(4,1);
    Xvals(1,1)=X(1);
    Xvals(2,1)=X(2);
    
    %Simulation
    while t<300
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
            dv(3)=2+rand;
            %Is the event delayed?
            if dv(j) > 0
              list = add(list, t+dv(j), j); %delay, update the list
            else
              X = X+V(:, j);   %no delay, update state vector
            end
            for k1=1:4
                if X(k1)<0
                    X(k1)=0;
                end
            end
                
        else 
            [firetime rxn]=fire(list);
            X=X+V(:,rxn);
            for k2=1:4
                if X(k2)<0
                    X(k2)=0;
                end
            end
            t=firetime;
            list=remove(list);
        end
     i=i+1;
     tvals(i)=t;
     Xvals(:,i)=X;
    end
plot(tvals, Xvals(1,:),'red', 'LineWidth', 2); hold on;
plot(tvals, Xvals(4,:),'green', 'LineWidth', 2);
plot(tvals, Xvals(2,:),'b', 'LineWidth', 2);
plot(tvals, Xvals(3,:),'black', 'LineWidth', 2);