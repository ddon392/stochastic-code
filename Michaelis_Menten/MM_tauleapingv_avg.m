index=1;
tfix=0.1:0.2:50;
for time=tfix
    for r=1:10

%stoichiometric matrix
V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%%
X = zeros(4,1);
X(1) = 200; % molecules of substrate
X(2) = 100; % molecules of enzyme 
c(1) = 1.5e-3; c(2) = 1e-4; c(3) = 0.1;
i=1;
t=0;
e=0.03;
tvals(1)=t;

while t<50
    a(1) = c(1)*X(1)*X(2);
    a(2) = c(2)*X(3);
    a(3) = c(3)*X(3);
    mean=abs(V(1,1)*a(1)+V(1,2)*a(2)+V(1,3)*a(3));
    var=a(1)*(V(1,1))^2+a(2)*(V(1,2))^2+a(3)*(V(1,3))^2;
    tau=min(max(e*X(1)/2,1)/mean,(max(e*X(1)/2,1))^2/var);
    dX=poissrnd(tau*a(1))*V(:,1) + poissrnd(tau*a(2))*V(:,2) + poissrnd(tau*a(3))*V(:,3); %number of reactions skipped
    X = X + dX;
        for k1=1:4
            if X(k1)<0
                X(k1)=0;
            end
        end
        t=t+tau;
        i=i+1;
        Xvals(:,i)=X;
        tvals(i)=t;
        end 
     lengthtime(r)=length(tvals);
     k=max(find(tvals<time));
     Xfinal(:,r)=Xvals(:,k);
    end
    Xavg1(index)=mean(Xfinal(1,:));
    Xavg4(index)=mean(Xfinal(4,:));
    lengthavg(index)=mean(lengthtime);
    index=index+1;
end
plot(tfix, Xavg1);