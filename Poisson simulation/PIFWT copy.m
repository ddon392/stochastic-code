function tau=PIFWT(lambda,thres,N)
%tau=PIFWT(lambda,thres,N)
%
%This function produces a list of waiting times for a PIF Neuron,
%first by generating a Poisson Process by sampling from an exponential
%distribution with parameter lambda and then summing successive entries in
%groups of size "thres," the threshold for the neuron to
%fire and return to its ground state. If the number of spikes in the
%Poisson Process, N, is not divisible by the threshold, the waiting time
%for the last firing is undefined, and thus the remainder of N/thres is
%truncated from the process.
%
%See Interevent, rem, reshape, sum
%
%[Website address]
%
%omarscha
%Math Department
%University of Houston

t=Interevent(lambda,N);
r=rem(N,thres);
tcut=t(1:(N-r));
T=reshape(tcut,thres,(N-r)/thres);
tau=sum(T)';