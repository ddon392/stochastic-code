% pure_death_process expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_death_process
%
% tranht (June 22, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
GR = 1.61803399;
mk_figure([6.87, 6.87/2/GR]);
h = mk_axes({'c', 1,});

%--------------------------------------------------------------------------
% Denisty

load data/data_2.mat
axes(h{1}); hold on;
ph = pcolor(t, Xaxis, D);
colormap(bone);
plot(t, 100*exp(-t));
xlim([0, t(end)])

xlabel('Time');
ylabel('State');
axes_label('B');

%--------------------------------------------------------------------------
% Export

%axes_label(lA, 10, 5); axes_label(lB, 10, 5); axes_label(lC, 10, 5);
%export_fig('figs/pure_death_process.pdf', '-nocrop');
%axes_label(lA, 10, 0); axes_label(lB, 10, 0);
%export_fig('figs/pure_death_process.png', '-m2', '-nocrop');