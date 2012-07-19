X=1;
c=1;
index=1;     %index to keep track of Xvals and tvals
t=0;     %initial time
e=0.03;  %bounded value for propensity a
tvals(1)=t;
Xvals(1)=X;
list=dlList;

while t<10
 a=c*X;
 tau=min((max(e*X,1)/a),((max(e*X,1))^2/a));   %choose different tau in every time step
 nextt=inf;
    %check the stack for any scheduled rxn
    if list.fill>0
        for i=1:list.fill
         nextt(i)=list.t(i)-t;
        end
    end
    if tau<nextt                                    %the case when list.fill empty and the case when no scheduled rxn in [t, t+tau) set nexxt=inf 
        t=t+tau;
		skip=poissrnd(tau*a);
        if skip>0                     
		for m=1:skip
            list=add(list,t+rand,skip);  %in this case, we know it's the birth rxn
        end
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
plot(tvals, Xvals, 'LineWidth', 2);hold on;


 