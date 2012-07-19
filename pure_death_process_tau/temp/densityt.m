%---------------------------------------------------%
%This function is to plot the density               %
%of the pure-death-process using tauleaping         %
%Input: N-number of initial molecules, j-number     %
%of simualations, tfinal: time, c-rate of a process %
%and L-number of tau bins.                          %
%Output: densityplot                                %
%---------------------------------------------------%
%Hong Tran  
    
function[]=densityt(N,c,j, tfinal, L)
   
    A=zeros(L+1, j);
    for r=1:j
    X=N;           %Initial number of molecules X0
    tvals(1) = 0;
    Xvals(1) = X;
    tau=tfinal/L;
    
    %For loop to implement tau-leaping algorithm
    for k=1:L
        a=c*X;
        X=X-poissrnd(tau*a);
        Xvals(k+1)=X;
    end
    
    A(:,r)=Xvals;
    end
    
    for k=1:L+1
    [x y z]=density(A(k,:), [0 N+1], N+1);
    Pdens(:,k)=y;
    end
    pcolor(Pdens)
    
    hold on
end 
    

    
   