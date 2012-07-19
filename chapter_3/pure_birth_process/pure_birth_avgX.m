%----------------------------------------------------------------
%pure_birth_avgX
%
%[tfix Xavg error e D]=pure_birth_avgX(X0, c)
%Input: X0: initial number of moleclues, c is the rate
%constant
%Output: tfix: time bins, Xavg: avarage values for state 
%vectors, error: standard deviation from the avarage values
%e: error and D: density matrix
%
%----------------------------------------------------------------
function[tfix Xavg error e D]=pure_birth_avgX(X0, c)
index=1;
tfix=0.1:0.1:4.5;
for time=tfix
    for r=1:1000
    X=1;
    c=1;
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
    lengthtime(r)=length(tvals);
    end
 [e, heights] = histogram(Xfinal, 'Discrete', 'PDF', {[0 100]});
 D(:,index)=heights;
 Xavg(index)=mean(Xfinal);
 error(index)=std(Xfinal);
 stepavg(index)=mean(lengthtime);
 index=index+1;
end
%plot(tfix, Xavg, 'r', 'LineWidth', 2); hold on;
%Compare with real solution
%plot(tfix, exp(tfix), 'b', 'LineWidth', 2); 