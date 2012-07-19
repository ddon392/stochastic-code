%Simple implementation of Euler-Maruyama to simulate
%the Chemical Langevin Equation for the Michaelis-Menten
%system


clf

randn('state',100)

%stoichiometric matrix
V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];

%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%%

Y = zeros(4,1);
Y(1) = 300; % molecules of substrate
Y(2) = 120; % molecules of enzyme 
c(1) = 1.5e-3;; c(2) = 1e-4; c(3) = 0.1;

tfinal = 50;
L = 250;
tau = tfinal/L;    % stepsize

Yvals = zeros(4,L+1);
Yvals(1,1) = Y(1);
Yvals(2,1) = Y(2);
for k = 1:L
     a(1) = c(1)*Y(1)*Y(2);
     a(2) = c(2)*Y(3);
     a(3) = c(3)*Y(3);
     d(1) = tau*a(1) + sqrt(abs(tau*a(1)))*randn;
     d(2) = tau*a(2) + sqrt(abs(tau*a(2)))*randn;
     d(3) = tau*a(3) + sqrt(abs(tau*a(3)))*randn;
     Y = Y + d(1)*V(:,1) + d(2)*V(:,2) + d(3)*V(:,3);
     Yvals(:,k+1) = Y;
end

tvals = [0:tau:tfinal];
plot(tvals,Yvals(1,:),'go-')
hold on
plot(tvals,Yvals(4,:),'r*-')

axis([0 55 0 310])