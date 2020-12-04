%
%	Make the H&J Hue cancellation figure
%
cd /home/brian/book/08col/fig/subHueCancel

%
%	Obs H
%
p = plot( ...
	rgHw,rgHs,'wx', ...
	byHw,byHs,'wo');

plotParms(p)
xtick = [400:50:700];
ytick = [-1:.2:.8];
set(gca,'xlim',[380 720],'ylim',[-1 .8])
set(gca,'xtick',xtick,'ytick',ytick)
grid on
set(p,'markersize',8)
print -deps obsH.eps

%
%	Obs J
%
p = plot( ...
	rgJw,rgJs,'wx', ...
	byJw,byJs,'wo');

plotParms(p)
xtick = [400:50:700];
ytick = [-1:.2:.8];
set(gca,'xlim',[380 720],'ylim',[-1 .8])
set(gca,'xtick',xtick,'ytick',ytick)
grid on
set(p,'markersize',8)
print -deps obsJ.eps

