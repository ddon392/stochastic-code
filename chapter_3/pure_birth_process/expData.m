% pure_birth_process expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=3#pure_birth_process
%
% tranht (June 22, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
GR = 1.61803399;
mk_figure([6.87, 6.87/2/GR]);
h = mk_axes({'c', 3,});

%--------------------------------------------------------------------------
% Realization

load data/data_1.mat

axes(h{1}); hold on;
numTrials = size(t, 2);
for j=1:numTrials
   stairs(t(:,j), X, 'Color', [0 1-j/numTrials j/numTrials]); 
end
xlim([0 6.5]);

xlabel('Time');
ylabel('State');
A=axes_label('A');

%--------------------------------------------------------------------------
% Density

load data/data_2.mat

axes(h{2}); hold on;
plot(tfix, Xavg, 'r', 'LineWidth', 2);
error1=error.*ones(size(tfix));
errorbar(tfix, Xavg, error1);
axis([0 4.6 0 100]);

xlabel('Time');
ylabel('State');
B=axes_label('B');

%--------------------------------------------------------------------------
% Histograms

axes(h{3}); hold on;

histogram_plot(e, D(:, 10), 0, 'xyz', 'FaceColor', [.3 .3 .8]);
histogram_plot(e, D(:, 25), 0, 'xyz', 'FaceColor', [.3 .8 .3]);
histogram_plot(e, D(:, 30), 0, 'xyz', 'FaceColor', [.8 .3 .3]);
xlim([0 100]);

xlabel('State');
ylabel('Density');
C=axes_label('C');

%--------------------------------------------------------------------------
% Export

axes_label(lA, 10, 5); axes_label(lB, 10, 5); axes_label(lC, 10, 5);
export_fig('figs/pure_birth_process.pdf', '-nocrop');
axes_label(lA, 10, 0); axes_label(lB, 10, 0);
export_fig('figs/pure_birth_process.png', '-m2', '-nocrop');