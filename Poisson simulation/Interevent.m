%Hong Tran
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Poisson simulation using Gillespie's algorithm  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function is to produce random waiting time from
%the exponential distribution. 
%Input:
%lamda: the rate of the process
%N: number of events occur
%Output: the vector of waiting time between 2 events


function[tau]=Interevent(lamda,N)
    tau=log(1./rand(N,1))./lamda;
end 
    