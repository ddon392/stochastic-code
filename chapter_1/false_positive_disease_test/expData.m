% false_positive_disease_test expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
%
% URL: 
%    
%   http://math.uh.edu/stochastic/Notes/?chapter=1#false_positive_disease_test
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
% Varying sample size.

load data/data_1.mat

axes(ah{1}); hold on; %#ok<*MAXES>
plot(N, ratio, 'b.');
plot(N, 0.01+1./sqrt(N), 'r');
xlabel('Number of patients');
ylabel('P(D|+)');
lA = axes_label('A');

%--------------------------------------------------------------------------
% Varying probability of disease

load data/data_2.mat

axes(ah{2}); hold on;
plot(p_disease, ratio, 'b.');
ylim([0, 0.55]);
xlabel('Probability of disease');
yl = ylabel('P(D|+)');
lB = axes_label('B');

%--------------------------------------------------------------------------
% Exporting figure

export_fig('figs/false_positive_disease_test.png', '-m2', '-nocrop');
lA = axes_label(lA, 5, 10); lB = axes_label(lB, 5, 10);
export_fig('figs/false_positive_disease_test.pdf', '-nocrop');
