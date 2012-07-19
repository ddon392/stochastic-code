%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Michaelis-Menten system, tauleaping %
%  algorithm to accelerate SSA         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hong Tran%

tfinal = 50;
L = 140;
tau = tfinal/L; 
t=0:tau:tfinal;   
%stoichiometric matrix
V = [-1 1 0; -1 1 1; 1 -1 -1; 0 0 1];
A1=zeros(L+1, 1000);
A2=zeros(L+1, 1000);
A3=zeros(L+1, 1000);
A4=zeros(L+1, 1000);

for r=1:1000

%%%%%%%%%% Parameters and Initial Conditions %%%%%%%%%
Y = zeros(4,1);
Y(1) = 200; % molecules of substrate
Y(2) = 100; % molecules of enzyme 
c(1) = 1.5e-3; c(2) = 1e-4; c(3) = 0.1;
Yvals = zeros(4,L+1);
Yvals(1,1) = Y(1);
Yvals(2,1) = Y(2);
for k = 1:L
     a(1) = c(1)*Y(1)*Y(2);
     a(2) = c(2)*Y(3);
     a(3) = c(3)*Y(3);
     dY=poissrnd(tau*a(1))*V(:,1) + poissrnd(tau*a(2))*V(:,2) + poissrnd(tau*a(3))*V(:,3); %number of reactions skipped
     Y = Y + dY;
     if Y(1)<0
         Y(1)=0;
     end
     if Y(2)<0
         Y(2)=0;
     end
     if Y(3)<0
         Y(3)=0;
     end
     if Y(4)<0
         Y(4)=0;
     end
     Yvals(:,k+1) = Y;
end
	A1(:,r)=Yvals(1,:);
	A2(:,r)=Yvals(2,:);
	A3(:,r)=Yvals(3,:);
	A4(:,r)=Yvals(4,:);
end
for i=1:L+1
	Yavg1(i) = mean(A1(i,:));
	Yavg2(i) = mean(A2(i,:));
	Yavg3(i) = mean(A3(i,:));
	Yavg4(i) = mean(A4(i,:));
    end
tvals = [0:tau:tfinal];
plot(tvals,Yavg1,'g', 'LineWidth',2);hold on;
plot(tvals,Yavg2,'black', 'LineWidth',2);
plot(tvals,Yavg3, 'LineWidth',2);
plot(tvals,Yavg4,'r', 'LineWidth',2);
hold on
save('MM_tauf_140.mat', 'Yavg1', 'Yavg2', 'Yavg3', 'Yavg4', 'tvals', 'L', 'tau', 'tfinal');
%plot(tvals,Yvals(4,:),'r*-')

%axis([0 55 0 310])