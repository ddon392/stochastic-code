index=1;
tfix=0.1:0.1:10;
for time=tfix
for r=1:100
X=1;
c=1;
i=1;    %index to keep track of Xvals and tvals
t=0;    %initial time
e=0.03; %bounded value for propensity a
tvals(1)=t;
Xvals(1)=X;
list=dlList;
dv=2;
while t<10
 a=c*X;
 tau=min((max(e*X,1)/a),((max(e*X,1))^2/a));   %choose different tau in every time step
 nextt=inf;
    if list.fill>0
     nextt=fire(list)-t;
    end
 if tau<nextt      %you can't just set nextt=dv and compare tau to nexxt, miss the first case then
    t=t+tau;
	skip=poissrnd(a*tau);
    if skip>0
        list=add(list, t+dv, skip);
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
    k=max(find(tvals<time));
    Xfinal(r)=Xvals(k);
    lengthtime(r)=length(tvals);
    end
 Xavg(index)=mean(Xfinal);
 stepavg(index)=mean(lengthtime);
 index=index+1;
end
plot(tfix, Xavg, 'r', 'LineWidth', 2); hold on;