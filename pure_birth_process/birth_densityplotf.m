%---------------------------------------------------%
%This function is to plot the density               %
%of the pure-birth-process                          %
%Input: N-number of initial molecules, j-number     %
%of simualations, tfinal: time                      %
%Output: densityplot                                %
%---------------------------------------------------%
%Hong Tran, June 17th, 2012

function[]=birth_densityplot(N, j, tfinal)
        index=1;                %to keep track of number of time bin
    for tfix=0.5:0.5:tfinal  
        A=zeros(N+1,j+1);
        A(:,1)=(1:1:N+1);      %each timestep number of molecules reduce by 1
        tau=log(1./rand(N,j))./repmat(A(1:N,1),[1 j]);  %random time interval between 2 events
        A(2:N+1,2:j+1)=cumsum(tau); %time at which a reaction takes place
        B=tfix>A(:,2:j+1);           %matrix of 0 and 1
        for i=1:j
        k(i)=max(find(B(:,i))); 
        end 
        [x y dt]=density(A(k,1),[1 N+2],N+1);
        Pdens(:,index)=y;               %Matrix with columns are Xfinals at different tfix
        index=index+1;                  %increment index
    end
   %Present the densityplot
   pcolor(Pdens)
   %colormap(bone)
end