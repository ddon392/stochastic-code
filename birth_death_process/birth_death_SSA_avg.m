index=1;
tfix=0.1:0.1:10;
for time=tfix
    for r=1:100
    X=100;
    t=0;
    i=1;
    V=[1 -1];
    tvals(1)=0;
    Xvals(1)=X;
    alpha = 300;     
    beta = 0.1;
    gammar = 80.0;
    C0 = 10.0;
    R0 = 1.0;
    while t<10
     a(1) = alpha*C0*C0/(C0+X)/(C0+X);
     a(2) = beta*X+gammar*X/(R0+X);   
     asum=sum(a);
     tau=-log(rand)/asum;
     j=min(find(rand<cumsum(a/asum)));
     X=X+V(j);
     t=t+tau;
     i=i+1;
     tvals(i)=t;
     Xvals(i)=X;
    end
    lengthtime(r)=length(tvals);
    k=find(tvals<time,1,'last');
    Xfinal(r)=Xvals(k);
    end
    Xavg(index)=mean(Xfinal);
    lengthavg(index)=mean(lengthtime);
    index=index+1;
end

plot(tfix, Xavg, 'r', 'LineWidth', 2)