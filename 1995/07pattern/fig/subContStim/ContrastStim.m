%
%	Make the sinusoids and their sums
%
cd /wusr5/brian/book/06space/fig/subContStim

x = [-.75:1/64:.75]
s = 0.5;

f = 1;
c1 = s*cos(2*pi*f*x);
f = 3;
c3 = s*cos(2*pi*f*x);

plotParms(plot(x,c1))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps f1.eps

plotParms(plot(x,c3))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps f3.eps

plotParms(plot(x,c1 + c3))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps peakAdd.eps

plotParms(plot(x,c1 - c3))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps peakSub.eps


