% logistic_process genData file
% 
%     Calling the functions stochlog and xcorr, we will generate 4 sets of
%     data: population trends for alpha=0,0.1,0.25; and the autocorrelation
%     of the alpha=0.1 realization.
%     
%     http://math.uh.edu/stochastic/Notes/?chapter=3#logistic_process
%
% omarscha (June 30, 2012)
% University of Houston
% Department of Mathematics

%--------------------------------------------------------------------------
% Realization with alpha=0

N=12000000;
r=1;
K=100;
alpha=0;
fprintf('Computing population trend and time steps...\n');
tic;
[T1 X1]=stochlog(N,r,K,alpha);
toc
save('data/data_1.mat','X1','T1','N')

%--------------------------------------------------------------------------
% Realization with alpha=0.1

N=12000000;
r=1;
K=100;
alpha=0.1;
fprintf('Computing population trend and time steps...\n');
tic;
[T2 X2]=stochlog(N,r,K,alpha);
toc
save('data/data_2.mat','X2','T2')

%--------------------------------------------------------------------------
% Realization with alpha=0.2

N=12000000;
r=1;
K=100;
alpha=0.2;
fprintf('Computing population trend and time steps...\n');
tic;
[T3 X3]=stochlog(N,r,K,alpha);
toc
save('data/data_3.mat','X3','T3')

%--------------------------------------------------------------------------
% Autocorrelation sequence with alpha=0.1

fprintf('Computing autocorrelation sequence for X2...\n');
tic;
[eT2 eP2]=evenT(T2(8000000:10000000),X2(8000000:10000000));
[autocorr lags]=xcorr(eP2,'coeff');
toc
save('data/data_4.mat','autocorr','lags')