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
        tau=min((max(e*X,1)/abs(a(1)-a(2))),((max(e*X,1))^2/a(1)+a(2)));
        t=t+tau;
        X=X+poissrnd(tau*a(1))-poissrnd(tau*a(2));
        if X<0
            X=0;
        end
        i=i+1;
        tvals(i)=t;
        Xvals(i)=X;
    end
    plot(tvals, Xvals, 'g');hold on;