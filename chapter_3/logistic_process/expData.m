% logistic_process expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=3#logistic_process
%
% omarsca (June 30, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
mk_figure
h=mk_axes({'r',2,{'c',2},{'c',3}});

%--------------------------------------------------------------------------
% Population Trend for alpha=0

load data/data_1.mat

axes(h{2}{1}); hold on;

plot(T1,X1,'g');
xlabel('Time');
ylabel('Population Size');
ylim([0 500]);
lA1=axes_label('A1');

%--------------------------------------------------------------------------
% Population Trend for alpha=0.1

load data/data_2.mat

axes(h{2}{2}); hold on;

plot(T2,X2,'g');
xlabel('Time');
ylabel('Population Size');
ylim([0 500]);
lA2=axes_label('A2');

%--------------------------------------------------------------------------
% Population Trend for alpha=0.2

load data/data_3.mat

axes(h{2}{3}); hold on;

plot(T3,X3,'g');
xlabel('Time');
ylabel('Population Size');
ylim([0 500]);
lA3=axes_label('A3');

%--------------------------------------------------------------------------
% Autocorrelation of alpha=0.1 Realization Against Time-Step Lag

load data/data_4.mat

axes(h{1}{1}); hold on;

plot(lags,autocorr,'b')
xlabel('Time Lag')
ylabel('Autocorrelation')
ylim([0 1]);
lB=axes_label('B');

%--------------------------------------------------------------------------
% Population Size Histograms

W1=[diff(T1);0];
W2=[diff(T2);0];
W3=[diff(T3);0];
[e1 h1]=histogram({X1(100000:end),W1(100000:end)},'Discrete','PDF');
[e2 h2]=histogram({X2(100000:end),W2(100000:end)},'Discrete','PDF');
[e3 h3]=histogram({X3(100000:end),W3(100000:end)},'Discrete','PDF');
axes(h{1}{2}); hold on;
HP1=histogram_plot(e1,h1);
HP2=histogram_plot(e2,h2);
HP3=histogram_plot(e3,h3);
set(HP1, 'FaceColor', [0 191 255]/260, 'FaceAlpha', 0.5);
set(HP2, 'FaceColor', [255 90 0]/260, 'FaceAlpha', 0.5);
set(HP3, 'FaceColor', [20 220 38]/260, 'FaceAlpha', 0.5);
xlabel('Population Size at Equilibrium');
ylabel('Probability Density');
lC=axes_label('C');

%--------------------------------------------------------------------------
% Export

export_fig('figs/logistic_process.png', '-m2', '-nocrop');
lA1 = axes_label(lA1, 5, 10);
lA2 = axes_label(lA2, 5, 10);
lA3 = axes_label(lA3, 5, 10);
lB = axes_label(lB, 5, 10); 
lC = axes_label(lC, 5, 10); 
export_fig('figs/logistic_process.pdf', '-nocrop');