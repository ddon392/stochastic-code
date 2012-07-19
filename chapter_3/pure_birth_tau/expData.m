% pure_birth_tau expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_birth_tau
%
% tranht (June 22, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
GR = 1.61803399;
mk_figure([6.87, 6.87/2/GR]);
h = mk_axes({'c', 2,});

%--------------------------------------------------------------------------
% Exact SSA and tau leaping in pure birth process

load data/data1.mat

axes(h{1}); hold on;
plot(t, mean_, 'r', 'LineWidth', 2);
plot(t, X0*exp(t), 'LineWidth',3);
load data/data3.mat
plot(t1, mean1, 'g', 'LineWidth', 2);

xlabel('Time');
ylabel('State');
A1=axes_label('A');
axis([0 6.5 0 700]);

%--------------------------------------------------------------------------
% Density

load data/data2.mat

axes(h{2}); hold on;
[f x]=ksdensity(Xfinal);
plot(x, f);
load data/data1.mat
[f1 x1]=ksdensity(A(66,:));
plot(x1, f1,'r');
load data/data3.mat
[f2 x2]=ksdensity(A1(131,:));
plot(x2, f2,'g');


xlabel('State');
ylabel('Frequency');
B1=axes_label('B');
axis([0 50 0 0.18]);


%--------------------------------------------------------------------------

% Export
%export_fig('figs/pure_birth_tau.pdf', '-nocrop');
% A1=axes_label(A1, 8, 5); B1=axes_label(B1, 8, 5); 
% export_fig('figs/pure_birth_tau.png', '-m2', '-nocrop');