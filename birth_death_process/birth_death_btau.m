    X=100;
    alpha = 300;     
    beta = 0.1;
    gammar = 80.0;
    C0 = 10.0;
    R0 = 1.0;
    V=[1 -1];
    i=1;
    t=0;
    e=0.03;
    tvals(1)=0;
    Xvals(1)=X;
    while t<20
        a(1) =alpha*C0*C0/(C0+X)/(C0+X);
        a(2) =beta*X+gammar*X/(R0+X); 
        asum=a(1)+a(2);
        N=X;
        tau=min((max(e*X,1)/abs(a(1)-a(2))),((max(e*X,1))^2/(a(1)+a(2))));
        p=(a(1)+a(2))*tau/N;
        if p>1
            B=binornd(N,1);
        else
            B=binornd(N, (a(1)+a(2))*tau/N);
        end
        K(1)=binornd(B,a(1)/asum);
        K(2)=B-K(1);
        t=t+tau;
        X=X+K(1)-K(2);
        i=i+1;
        tvals(i)=t;
        Xvals(i)=X;
    end
    plot(tvals, Xvals, 'g');hold on;