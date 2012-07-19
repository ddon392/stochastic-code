%---------------------------------------------------%
%This function is to plot the density               %
%of the pure-death-process using tauleaping         %
%Input: N-number of initial molecules, j-number     %
%of simualations, tfinal: time, c-rate of a process %
%and L-number of tau bins.                          %
%Output: densityplot                                %
%---------------------------------------------------%
%Hong Tran  
    
function[t Xaxis D mean_]=densitytau(N,c,j, tfinal,L)
tau=tfinal/L;
t=[0:tau:tfinal];
Xaxis = 0:N;
D = zeros(N+1, L+1);
mean_ = zeros(size(t));

	A=zeros(L+1, j);
    for r=1:j
    X=N;           %Initial number of molecules X0
    Xvals(1) = X;
    %For loop to implement tau-leaping algorithm
    for i=1:L
        a=c*X;
        X=X-poissrnd(tau*a);
        Xvals(i+1)=X;
    end
    A(:,r)=Xvals;
    end
    for k=1:L+1
    [e, heights] = histogram(A(k,:), 'Discrete', 'PDF', {[0 N]});
    D(:,k)=heights;
	mean_(k) = mean(A(k,:));
    end
 %pcolor(t,Xaxis,D);
 %colormap(bone); hold on;
 %plot(t, mean_,'r');
 
end 
    

    
   