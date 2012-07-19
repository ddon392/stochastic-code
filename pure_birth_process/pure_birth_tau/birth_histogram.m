function[Xfinal]=birth_histogram(X0, c, time, R)
for r=1:R
    X=X0;
    tvals(1)=0;
    Xvals(1)=X;
    i=1;
    t=0;
    while X<200  %control number of molecules, normall set it less than number which is much bigger than 4.5/ no should set number of X, not t, need to get the appropriate number for Xmax
    a=c*X;        %the bigger it is the better accuracy but need the smallest to be accurate
    tau=-log(rand)/a;
    t=t+tau;
    X=X+1;
    i=i+1;
    tvals(i)=t;
    Xvals(i)=X;
    end
    k=max(find(tvals<time));
    Xfinal(r)=Xvals(k);
end