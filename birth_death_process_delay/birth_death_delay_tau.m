X=100;
Xvals(1)=X;
tvals(1)=0;
list=dlList;
t=0;
c=1;
i=1;
V=[1 -1];
e=0.03;
%Parameter
alpha = 300;     
beta = 0.1;
gammar = 80.0;
C0 = 10.0;
R0 = 1.0;
dv(1)=2;
dv(2)=0;   %no delay for the death process
while t<30 %tfinal
    a(1) = alpha*C0*C0/(C0+X)/(C0+X);
    a(2) = beta*X+gammar*X/(R0+X); 
    asum=sum(a);
    tau=min((max(e*X,1)/abs(a(1)-a(2))),((max(e*X,1))^2/(a(1)+a(2))));
    nextt=inf;
    %check the stack for any scheduled rxn
    if list.fill>0
        nextt=fire(list)-t;
    end
    
    if tau<nextt
        t=t+tau;
        death=poissrnd(tau*a(2));
        X=X-death;%no delay for death, update X immediately
        if X<0
            X=0;
        end
        birth=poissrnd(tau*a(1));
        if birth>0 
            list=add(list,t+dv(1),birth);
        end
    else
        [firetime rxn]=fire(list);
        t=firetime;
        X=X+rxn;
        list=remove(list);    
    end
    i=i+1;
    tvals(i)=t;
    Xvals(i)=X;
end
plot(tvals, Xvals, 'r', 'LineWidth', 2);