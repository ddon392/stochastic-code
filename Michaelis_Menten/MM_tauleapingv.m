%stoichiometric matrix
V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];

%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%%

X = zeros(4,1);
X(1) = 200; % molecules of substrate
X(2) = 100; % molecules of enzyme 
c(1) = 1.5e-3; c(2) = 1e-4; c(3) = 0.1;
Svals(1) = X(1);
Pvals(1) = 0;
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
    t=t+tau;
    i=i+1;
    tvals(i)=t;
    Svals(i)=X(1);
	Evals(i)=X(2);
	Cvals(i)=X(3);
    Pvals(i)=X(4);
end
plot(tvals, Svals, 'go--');
hold on
plot(tvals, Pvals, 'r*-');
plot(tvals, Cvals, 'LineWidth', 2);
plot(tvals, Evals, 'black', 'LineWidth', 2);
