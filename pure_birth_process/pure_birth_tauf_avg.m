
    tfinal=6.5;
    L=470;
    tau=tfinal/L;
    t=0:tau:tfinal;
    A=zeros(L+1, 1000);
    for r=1:1000
    X=1;           %Initial number of molecules X0
    Xvals(1) = X;
    c=1;
    %For loop to implement tau-leaping algorithm
    for i=1:L
        a=c*X;
        X=X+poissrnd(tau*a);
        Xvals(i+1)=X;
    end
    A(:,r)=Xvals;
    end
    for k=1:L+1
	mean_(k) = mean(A(k,:));
    end
    
    plot(t, mean_, 'r', 'LineWidth', 2); hold on;
    plot(t, exp(t), 'b', 'LineWidth', 2); 