% binomial_distribution expData file
%
%   Creates histograms for the output of binornd(n,p).
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=1#binomial_distribution
%
% jmlopez (May 30, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Setting up the figure.

GR = 1.61803399;
fh = mk_figure([6.87, 6.87/2/GR]);
ah = mk_axes({'c', 2});

%--------------------------------------------------------------------------
% Obtaining data
x1 = binornd(20, 0.5, [10000, 1]);
x2 = binornd(20, 0.7, [10000, 1]);
x3 = binornd(40, 0.5, [10000, 1]);

[e1 h1] = histogram(x1, 'Discrete', 'PDF');
[e2 h2] = histogram(x2, 'Discrete', 'PDF');
[e3 h3] = histogram(x3, 'Discrete', 'PDF');

%--------------------------------------------------------------------------
% 2D view

axes(ah{1}); hold on; %#ok<*MAXES>
[hp1 hl1] = histogram_plot(e1, h1); %#ok<*NASGU>
[hp2 hl2] = histogram_plot(e2, h2);
[hp3 hl3] = histogram_plot(e3, h3);
set(hp1, 'FaceColor', [.3 .3 .8], 'FaceAlpha', 0.8);
set(hp2, 'FaceColor', [.3 .8 .3], 'FaceAlpha', 0.8);
set(hp3, 'FaceColor', [.8 .3 .3], 'FaceAlpha', 0.8);

xlabel('r');
ylabel('Density');
lA = axes_label('A');

%--------------------------------------------------------------------------
% 3D view

axes(ah{2}); hold on;
[hp1 hl1] = histogram_plot(e1, h1, 0, 'yzx');
[hp2 hl2] = histogram_plot(e2, h2, 1, 'yzx');
[hp3 hl3] = histogram_plot(e3, h3, 2, 'yzx');
set(hp1, 'FaceColor', [.3 .3 .8], 'FaceAlpha', 0.8);
set(hp2, 'FaceColor', [.3 .8 .3], 'FaceAlpha', 0.8);
set(hp3, 'FaceColor', [.8 .3 .3], 'FaceAlpha', 0.8);

ylabel('r', 'Position', [2.5, 20, 0]);
zlh = zlabel('Density');
lB = axes_label('B');

%--------------------------------------------------------------------------
% Exporting figure

export_fig('figs/binomial_distribution.png', '-m2', '-nocrop');
lA = axes_label(lA, 5, 10); axes_label(lB, 5, 10);
export_fig('figs/binomial_distribution.pdf', '-nocrop');

