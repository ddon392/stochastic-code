X=100;
Xvals(1)=X;
tvals(1)=0;
list=dlList;
t=0;
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

while t<40 %tfinal
    a(1) = alpha*C0*C0/(C0+X)/(C0+X);
	a(2) = beta*X+gammar*X/(R0+X); 
	asum=sum(a);
	tau=min((max(e*X,1)/abs(a(1)-a(2))),((max(e*X,1))^2/(a(1)+a(2))));
    nextt=inf;
    %check the stack for any scheduled rxn
    if list.fill>0
        for i=1:list.fill
         nextt(i)=list.t(i)-t;
        end
    end
    if tau<nextt                                    %the case when list.fill empty and the case when no scheduled rxn in [t, t+tau) set nexxt=inf 
        t=t+tau;
		X=X-poissrnd(tau*a(2));%no delay for death, update X immediately
        if X<0
            X=0;
        end
        bd=poissrnd(tau*a(1)); %no of birth rxn delayed
                               %update the stack with new delayed events
		for m=1:bd
            list=add(list,t+2+rand,bd);  %in this case, we know it's the birth rxn
        end    
    else
			go=length(find(nextt<=tau));
			gomax=max(find(nextt<=tau));
			X=X+go;
			t=list.t(gomax);
			%update list
			for k1=1:go
			list=remove(list);
            end      
    end		
    index=index+1;
    tvals(index)=t;
    Xvals(index)=X;
end
plot(tvals, Xvals, 'LineWidth', 2);