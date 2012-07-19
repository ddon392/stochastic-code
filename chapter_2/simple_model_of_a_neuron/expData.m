% simple_model_of_a_neuron expData file
%
%   After calling the genData function/script we can use the data it
%   generated to plot our results.
% 
%   http://math.uh.edu/stochastic/Notes/?chapter=2#simple_model_of_a_neuron
%
% omarsca (June 24, 2012)
% Department of Mathematics
% University of Houston

%--------------------------------------------------------------------------
% Figure setup
mk_figure
h=mk_axes({'r',2,{'c',2}});

%--------------------------------------------------------------------------
% Spike Times

load data/data_1.mat

axes(h{2}); hold on;

t=linspace(1,T,N);
stairs(t,S','r');
xlabel('Time');
ylabel('Neural State');
ylim([0 thres+1]);
lA=axes_label('A');

%--------------------------------------------------------------------------
% Waiting Times Histograms

load data/data_2.mat

axes(h{1}{1}); hold on;
HP1=histogram_plot(e1,h1);
HP2=histogram_plot(e2,h2);
HP3=histogram_plot(e3,h3);
set(HP1, 'FaceColor', [131 111 255]/260, 'FaceAlpha', 0.8);
set(HP2, 'FaceColor', [111 255 131]/260, 'FaceAlpha', 0.8);
set(HP3, 'FaceColor', [170 180 111]/260, 'FaceAlpha', 0.8);
xlabel('Inter-spike Waiting Time');
ylabel('Probability Density');
lB=axes_label('B');

axes(h{1}{2}); hold on;
threshold=th1:th2-1;
plot(threshold',W,'*');
xlabel('Threshold');
ylabel('CV');
lC=axes_label('C');
%--------------------------------------------------------------------------
% Export

export_fig('figs/pif_neuron.png', '-m2', '-nocrop');
lA = axes_label(lA, 5, 10); 
lB = axes_label(lB, 5, 10); 
lC = axes_label(lC, 5, 10); 
export_fig('figs/pif_neuron.pdf', '-nocrop');