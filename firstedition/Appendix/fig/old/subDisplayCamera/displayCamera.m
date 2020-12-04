%
%	displayCamera figure in book
%
cd /home/brian/book/11app/fig/subDisplayCamera
%
load camera
load hit489Gam

display = hit489Gam(:,2);

plot(display)
intensity = [0:999]/1000;
frameBuffer = [0:255];

clf
p = plot(intensity,invCamera);
plotParms(p)
set(gca,'xlim',[0 1],'ylim',[0 260],'xtick',[0:.25:1])
axis square
print -deps camera.eps

p = plot(display,frameBuffer)
set(gca,'xlim',[0 1],'ylim',[0 260],'xtick',[0:.25:1])
plotParms(p)
axis square
print -deps display.eps

