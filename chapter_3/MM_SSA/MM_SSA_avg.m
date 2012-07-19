
function[tfix Xavg1 Xavg2 Xavg3 Xavg4 error1 error2 error3 error4 lengthavg ]=MM_SSA_avg(X1, X2, c1, c2,c3, R, tfinal) 
    index=1;
    tfix=0.5:0.5:tfinal;
    for time=tfix
    for r=1:R
    %%%Parameters and Initial Conditions
     V=[-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];
     c(1)=c1; c(2)=c2;c(3)=c3;
     X=zeros(4,1);      %Initialize state vector
     X(1)=X1; X(2)=X2;
     t=0;
     i=1;               %Index to keep track of time and state vector
     while t<tfinal
        a(1)=c(1)*X(1)*X(2);
        a(2)=c(2)*X(3);
        a(3)=c(3)*X(3);
        asum=sum(a);
        j=find(rand<cumsum(a/asum),1,'first');
        tau=log(1/rand)/asum;
        X=X+V(:,j);
        t=t+tau;
        i=i+1;
        Xvals(:,i)=X;
        tvals(i)=t;
     end 
     lengthtime(r)=length(tvals);
     k=find(tvals<time,1,'last');
     Xfinal(:,r)=Xvals(:,k);
    end
    Xavg1(index)=mean(Xfinal(1,:));
    error1(index)=std(Xfinal(1,:));
    Xavg2(index)=mean(Xfinal(2,:));
    error2(index)=std(Xfinal(2,:));
    Xavg3(index)=mean(Xfinal(3,:));
    error3(index)=std(Xfinal(3,:));
    Xavg4(index)=mean(Xfinal(4,:));
    error4(index)=std(Xfinal(4,:));
    lengthavg(index)=mean(lengthtime);
    index=index+1;
    end
end