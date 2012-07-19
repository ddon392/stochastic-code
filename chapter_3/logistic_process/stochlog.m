function [Time Pop]=stochlog(N,r,K,alpha)
%[Time Pop]=stochlog(N,r,K,alpha)
%
%This function produces two vectors, one ('Pop') whose ith entry is the 
%size of the population at the ith time step, and another ('Time') whose
%ith entry is the actual time elapsed at the ith time step. Time steps
%are not of uniform size--in fact they are random variables.
%
%The two vectors are generated in the same for loop. First we need to
%determine the time until the next event, regardless of whether it's a
%birth or death. That is done by picking a random number from an
%exponential distribution with parameter lambda+mu, where lambda and mu are
%each functions of the population size. Then we determine whether the event
%was a birth or death by picking a uniformly distributed random number from
%[0,1] and using lambda/(lambda+mu) as the probability of birth. The
%population is then changed accordingly.
%
%http://math.uh.edu/stochastic/Notes/?chapter=3#logistic_process
%
%omarscha (June 28, 2012)
%Math Department
%University of Houston

X=zeros(N,1);
X(1)=4;
T=zeros(N,1);
for k=2:N
    mu=r*(X(k-1)^2*(1/K+alpha));
    lambda=r*(X(k-1)+alpha*X(k-1)^2);
    r1=rand;
    r2=log(1/rand)/(lambda+mu);
    T(k)=T(k-1)+r2;
    if r1<(lambda/(lambda+mu))
        X(k)=X(k-1)+1;
    else X(k)=X(k-1)-1;
    end
end
Pop=X;
Time=T;
