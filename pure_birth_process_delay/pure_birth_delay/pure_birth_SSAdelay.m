
X=1;%number of molecules increases by 1
Xvals(1)=1;
tvals(1)=0;
list=dlList;
t=0;
c=1;
i=1;
%SSA simulation
while t<10
    a=c*X;
    tau=log(1/rand)/a;
    dv=rand;
    nextt=inf;
    
        if list.fill>0
            nextt=fire(list)-t;
        end
    %Check to see is there any schedule event?
    if tau < nextt          %No schedule event
           %Update Time
           t = t + tau;
           %Is the event delayed?
        if dv>0
        list=add(list,t+dv,1); %delayed
        else
        X=X+1;                  %Not delayed
        end
    else   %there is a delayed reaction set to finish in[t, t+tau)
        X=X+1;
        [firetime rxn]=fire(list);
        t=firetime;
        list=remove(list);
    end
  i=i+1;
  Xvals(i)=X;
  tvals(i)=t;      
end
stairs(tvals, Xvals, 'black', 'LineWidth',2); hold on;
hold on;
    
