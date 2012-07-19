X=100;
Xvals(1)=X;
tvals(1)=0;
list=dlList;
c=1;
index=1;
V=[1 -1];
%Parameter
alpha = 300;     
beta = 0.1;
gammar = 80.0;
C0 = 10.0;
R0 = 1.0;
e=0.03;
time=0;

while time<30 %tfinal
    a(1) = alpha*C0*C0/(C0+X)/(C0+X);
	a(2) = beta*X+gammar*X/(R0+X); 
	asum=sum(a);
	tau=min((max(e*X,1)/abs(a(1)-a(2))),((max(e*X,1))^2/(a(1)+a(2))));
    nextt=inf;
    %check the stack for any scheduled rxn
    if list.fill>0
        for i=1:list.fill
         nextt(i)=list.t(i)-time;
        end
    end
    if tau<nextt                                    %the case when list.fill empty and the case when no scheduled rxn in [t, t+tau) set nexxt=inf 
        time=time+tau;
		N=X;
        p=(a(1)+a(2))*tau/N;
        if p>1
            B=binornd(N,1);
        else
            B=binornd(N, (a(1)+a(2))*tau/N);
        end
        K(1)=binornd(B,a(1)/asum);
        K(2)=B-K(1);
        X=X-K(2);
                          %update the stack with new delayed events
		for m=1:K(1)
            list=add(list,time+0.2,K(1));  %in this case, we know it's the birth rxn
        end    
    else
			go=length(find(nextt<=tau));
			gomax=max(find(nextt<=tau));
			X=X+go;
			time=list.t(gomax);
			%update list
			for k1=1:go
			list=remove(list);
            end      
    end
    index=index+1;
    tvals(index)=time;
    Xvals(index)=X;
end
plot(tvals, Xvals, 'LineWidth', 2);