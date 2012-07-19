         
%---------------------------------------------------%
%This function is to plot the density               %
%of the MM system using tauleaping                  %
%Input: S-initial number of substrate molecules     %
%E-initial number of enzyme molecules               %
%R-number of simualations, tfinal: time, c1, c2, c3-%
%rate of a process, and L-number of tau bins.       %
%                                                   %
%Output: densityplot                                %
%---------------------------------------------------%
%Hong Tran  

function[]=MM_densitytauf(S, E, c1, c2, c3, R, L, tfinal)
%stoichiometric matrix
V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];
%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%%
A=zeros(L+1, R);
for r=1:R
Y = zeros(4,1);
Y(1) = S; 
Y(2) = E; 
c(1) = c1; c(2) = c2; c(3) = c3;
tau = tfinal/L;    % stepsize tau<=0.5626 if e=0.02
Yvals = zeros(4,L+1);
Yvals(1,1) = Y(1);
Yvals(2,1) = Y(2);
for k = 1:L
     a(1) = c(1)*Y(1)*Y(2);
     a(2) = c(2)*Y(3);
     a(3) = c(3)*Y(3);
     dY=poissrnd(tau*a(1))*V(:,1) + poissrnd(tau*a(2))*V(:,2) + poissrnd(tau*a(3))*V(:,3); %number of reactions skipped
     Y = Y + dY;
     Yvals(:,k+1) = Y;
end
A(:,r)=Yvals(1,:);
end

for i=1:L+1
    [x y z]=density(A(i,:), [0 S], S);
    
    Pdens(:,i)=y;
end
    pcolor(Pdens)
    colormap(bone)
    hold on
    