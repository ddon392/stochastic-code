function tau=PIFBT(lambda,thres,T,N)
%tau=PIFBT(lambda,thres,T,N)
%
%This function produces a vector whose ith entry is either a one, if the 
%neuron reaches threshold and fires at time bin i, or a zero, if the neuron
%does not fire at time bin i. To do so, the function first generates a
%Poisson Process by a series of many Bernoulli trials, the output of which
%is a vector with ones for firings at time i and zeros for silences. This
%vector is modified such that only the firings that cause the neuron to
%reach threshold are kept, ie the jth firing is removed if j is not
%divisible by thres.
%
%Warnings:
%(1) For computational convenience, it is assumed that thres>1. If this
%assumption is not made, the program may produce incorrect results. But the
%thres=1 case is just a Poisson Process, so this program would be
%unnecessary.
%(2) T,N, and lambda should be chosen such that the probability of multiple
%firings occuring in the same time bin is highly unlikely; otherwise the
%Bernoulli function will not faithfully represent a Poisson Process.
%
%See Bernoulli, cumsum, rem
%
%omarscha
%Math Department
%University of Houston

t=Bernoulli(lambda,T,N)
t2=cumsum(t);
t3=zeros(1,N);
for k=2:N
    if rem(t2(k),thres)==0 && t2(k)~=t2(k-1)  
        t3(k)=1;
    end
end
tau=t3';