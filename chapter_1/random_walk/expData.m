% random_walk expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=1#random_walk
%
% jmlopez (June 22, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
mk_figure;
h = mk_axes({'r', 2, {'c', 2}});

%--------------------------------------------------------------------------
% Realizations

load data/data_1.mat

axes(h{2}); hold on;

t = 0:T;
stairs(t, R');
plot(t, sqrt(t), 'k');
plot(t, -sqrt(t), 'k');

xlabel('Moves');
ylabel('Position');
lA = axes_label('A');

%--------------------------------------------------------------------------
% Density 

load data/data_2.mat

axes(h{1}{1}); hold on;

p = pcolor(1:T, Y, H(:, 2:end));
set(p, 'LineStyle', 'none');
ylim([Y(1), Y(end)]);
colormap(flipud(colormap('bone')));


xlabel('Moves');
ylabel('Position');
lB = axes_label('B');

%--------------------------------------------------------------------------
% Histogram

axes(h{1}{2}); hold on;

tau = 6;
[e1 h1] = histogram(R(:, tau), 'Discrete', 'PDF');
[e2 h2] = histogram(R(:, tau+1), 'Discrete', 'PDF');

[hp1 hl1] = histogram_plot(e1, h1, tau, 'yzx', 'FaceColor', [64 224 208]/255);
[hp2 hl2] = histogram_plot(e2, h2, tau+1, 'yzx', 'FaceColor', [84 155 159]/255);

xlabel('Moves');
ylabel('Position');
zlabel('Density');
lC = axes_label('C');

%--------------------------------------------------------------------------
% Export

export_fig('figs/random_walk.png', '-m2', '-nocrop');
lA = axes_label(lA, 5, 10); 
lB = axes_label(lB, 5, 10); 
lC = axes_label(lC, 5, 10); 
export_fig('figs/random_walk.pdf', '-nocrop');

