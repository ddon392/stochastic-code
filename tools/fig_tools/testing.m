figure;
h1 = axes('OuterPosition', [0,0,.5 1]);
set(h1,'LooseInset',get(h1,'TightInset'));
h2 = axes('OuterPosition', [.5,0,.5 1]);
set(h2,'LooseInset',get(h2,'TightInset'));

axes(h1);
plot([0 1], [4 5]);
axes_label('A');  

axes(h2);
plot([0 1], [4 5]);
axes_label('B');

export_fig('figs/testing.png', '-nocrop', '-painters');