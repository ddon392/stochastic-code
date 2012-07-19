% Stochastic Simulation in Michaelis Menten System expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=3#MM
%
% tranht (June 22, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
GR = 1.61803399;
%mk_figure([6.87, 6.87/2/GR]);
mk_figure([6.87, 6.87/2]);
h = mk_axes({'c', 1,});

%--------------------------------------------------------------------------
% Exact SSA and tau leaping in pure birth process

load data/data1.mat

axes(h{1}); hold on;
error11=error1.*ones(size(tfix));
error21=error2.*ones(size(tfix));
error31=error3.*ones(size(tfix));
error41=error4.*ones(size(tfix));
errorbar(tfix, Xavg1, error11,'r');
errorbar(tfix, Xavg2, error21);
errorbar(tfix, Xavg3, error31,'black');
errorbar(tfix, Xavg4, error41,'g');

xlabel('Time', 'FontSize', 14);
ylabel('State', 'FontSize', 14);
text(3,180,'Substrate','FontSize',12);
text(43,170,'Product','FontSize',12);
text(45,110,'Enzyme','FontSize',12);
text(38,42,'Complex','FontSize',12);
A=axes_label('A');
axis([0 50 0 200]);


% Export
 export_fig('figs/MM_SSA.pdf', '-nocrop');
 export_fig('figs/MM_SSA.png', '-m2', '-nocrop');