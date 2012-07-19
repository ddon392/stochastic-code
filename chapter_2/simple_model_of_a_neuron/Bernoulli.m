%Name: Hong Tran
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Bernoulli process to simulate Poisson Process              %     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function is to simulate Poisson process when the number of bins are 
%large, dt is small, the Poisson process is approximately equivalent
%to the Bernoulli process
%Parameter input:
%lamda: the rate of the process
%T:time
%N:the number of time bins
%Output: vector v of 0 and 1

function [v]=Bernoulli(lamda, T, N)
    u=rand(N,1);
    dt=T/N;
    v=u<lamda*dt; 
end
