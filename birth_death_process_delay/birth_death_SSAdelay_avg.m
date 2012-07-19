index=1;
tfix=0.1:1:30;
for time=tfix
    for r=1:100
X=100;
Xvals(1)=X;
tvals(1)=0;
list=dlList;
t=0;
c=1;
i=1;
V=[1 -1];
%Parameter
alpha = 300;     
beta = 0.1;
gammar = 80.0;
C0 = 10.0;
R0 = 1.0;
  %no delay for the death process
while t<30 %tfinal
    a(1) = alpha*C0*C0/(C0+X)/(C0+X);
    a(2) = beta*X+gammar*X/(R0+X); 
    asum=sum(a);
    tau=-log(rand)/asum;
    nextt=inf;
    %check the stack for any scheduled rxn
    if list.fill>0
        nextt=fire(list)-t;
    end
    
    if tau<nextt
        j=min(find(rand<cumsum(a/asum)));
        t=t+tau;
        dv(1)=2;   %dv(1) can be rand
        dv(2)=0; 
        if dv(j)>0
            list=add(list, t+dv(j), j);
        else
            X=X+V(j);
        end     
    else
        [firetime rxn]=fire(list);
        t=firetime;
        X=X+V(rxn);
        list=remove(list);    
    end
    i=i+1;
    tvals(i)=t;
    Xvals(i)=X;
end
    k=max(find(tvals<time));
    Xfinal(r)=Xvals(k);
    lengthtime(r)=length(tvals);
    end
 Xavg(index)=mean(Xfinal);
 stepavg(index)=mean(lengthtime);
 index=index+1;
end