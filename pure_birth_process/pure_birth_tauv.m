
index=1;
tfix=0.1:0.03:6.5;
for time=tfix
    for r=1:1000
	X=1;           %Initial number of molecules X0       
    i=1;    %index to keep track of vector time t and Xt
    t=0;
    c=1;
    tvals(1) = t;
    Xvals(1) = X;
    e=0.03;  %bounded value for propensity
    %While loop to implement tau-leaping algorithm
    while t<6.5  %X<N
        a=c*X;
        tau=min((max(e*X,1)/a),((max(e*X,1))^2/a));
        t=t+tau;
        X=X+poissrnd(tau*a);
        i=i+1;
        tvals(i)=t;
        Xvals(i)=X;
    end
     k=max(find(tvals<time));
     Xfinal(r)=Xvals(k);
     lengthtime(r)=length(tvals);
    end
    mean_(index)=mean(Xfinal);
    lengthmean(index)=mean(lengthtime);
    index=index+1;   
 end

 plot(tfix, mean_,'black', 'LineWidth', 2);hold on;
 %plot(tfix, exp(tfix),'g', 'LineWidth', 2);