%
%	Replot of Blakemore and Campbell data
%

cd /home/brian/book/06space/fig/subSpatialAdaptation

load bcData

xtick = [1 3 10 30 100 300 1000];
ytick = [1 3 10 30 100 300 1000];
xlim = [1 100];
ylim = [1 1000];

p = loglog(fA,sensA,'+', fwcf, fwcsens, '-', fwcf, fwcsens, 'o');
axis square
grid on
plotParms(p);
set(p(3),'markersize',8,'linewidth',0.3)
set(p(2),'markersize',8,'linewidth',0.3)
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim)
print -deps leftPanel.eps

%	Threshold elevation
xtick = [1 3 10 30 100 300 1000];
ytick = [.5 1 2 4];
xlim = [1 100];
ylim = [0.5 5];

p = loglog(fB,elev + 1 ,'+', fB, elev+ 1,'-');
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim)
grid on
plotParms(p);
axis square
print -deps rightPanel.eps


