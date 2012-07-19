function[tfix mean_]=pure_birth_avg(N,j, tfinal);
    index=1; 
    tfix=0.1:0.1:tfinal;        %to keep track of number of time bin
    for time=tfix 
        A=zeros(N+1,j+1);
        A(:,1)=(1:1:N+1);      %each timestep number of molecules reduce by 1
        tau=log(1./rand(N,j))./repmat(A(1:N,1),[1 j]);  %random time interval between 2 events
        A(2:N+1,2:j+1)=cumsum(tau); %time at which a reaction takes place
        B=time>A(:,2:j+1);           %matrix of 0 and 1
        for i=1:j
        k(i)=max(find(B(:,i))); 
        end 
        mean_(index)=mean(A(k,1));
        index=index+1;
    end
end
     

%For this method to accurate need to increase N till 1000 for tfinal=6.5
%and N=300 for tfinal =4.5