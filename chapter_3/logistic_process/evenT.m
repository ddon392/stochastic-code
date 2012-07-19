function [T P]=evenT(Time,Pop);
%[T P]=evenT(Time,Pop)
%
%This function produces takes the output of stochlog and produces a new
%time series using constant time steps, allowing the function xcorr to give
%a meaningful autocorrelation of the time series.
%
%Note: The constant time step used here is one-fifth of the average time
%step--this is just a matter of taste and can be changed.
%
%http://math.uh.edu/stochastic/Notes/?chapter=3#logistic_process
%
%omarscha (July 9, 2012)
%Math Department
%University of Houston

N=length(Time);
dt=Time(end)/(5*N);
T=0:dt:Time(end);
k=1;
P=zeros(1,length(T));
for k1=1:N
    while k*dt<Time(k1)
        P(k)=Pop(k1);
        k=k+1;
    end
end
