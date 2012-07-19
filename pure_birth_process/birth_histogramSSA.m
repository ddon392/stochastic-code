 %-------------------------------------------------%
 %This function is to plot the histogram           %
 %of the state of the system at a certain time in  %
 %a pure-birth-process                             %
 %Input: j-number of simulations, tfix-time, N-    %
 %number of initial molecules                      %
 %Output: Xfinal: the number of molecules at       %
 %a certain time from different simulations        %
 %-------------------------------------------------%
 
 %Hong Tran

 function[]=birth_histogramSSA(N, j, tfix)
  
 A=zeros(N+1,j+1);
 A(:,1)=(1:1:N+1);      %each timestep number of molecules reduce by 1
 tau=log(1./rand(N,j))./repmat(A(2:N+1,1),[1 j]);  %random time interval between 2 events
 A(2:N+1,2:j+1)=cumsum(tau); %time at which a reaction takes place
 B=tfix>A(:,2:j+1);           %matrix of 0 and 1
     for i=1:j
     k(i)=max(find(B(:,i))); 
     end 
 hist(A(k,1))   %Plot the frequency of X from different simulations
 end