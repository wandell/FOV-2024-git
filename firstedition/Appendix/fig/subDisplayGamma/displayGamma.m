%
%	Make the inset and main figure for the display gamma figure
%
cd /home/brian/book/11app/fig/subDisplayGamma

load hit489		%Spectral
load hit489Gam		%Both hit489Gam and invHit489Gam

intensity = sum(hit489)
phosphorResp = max(0,hit489Gam*diag(intensity));
gPhosphor = phosphorResp(:,2);
gPhosSF = gPhosphor / max(gPhosphor);
dac = 1:256;
p = plot(gPhosSF,'g--');
set(gca,'xlim',[0 260],'ylim',[0 1.1]);
grid on
plotParms(p);
print -deps displayGamma.eps

g = hit489(:,2);
g = g / max(g);
wave = 370:730;
p = plot(wave,g);
set(gca,'xlim',[350 750],'xtick',[400 500 600 700]);
set(gca,'ylim',[0 1.2],'ytick',[0 .5 1]);
grid on
plotParms(p);
print -deps maxGreen.eps

p = plot(wave,0.5*g);
set(gca,'xlim',[350 750],'xtick',[400 500 600 700]);
set(gca,'ylim',[0 1.2],'ytick',[0 .5 1]);
plotParms(p);
grid on
print -deps halfGreen.eps

%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Brightness conversion
%
p = plot(dac, phosphorResp(:,2) .^ .4);
set(gca,'xlim',[0 260],'ylim',[0 .5]);
set(gca,'xtick',[0:50:250],'ytick',[0:.1:.5]);
grid on
plotParms(p)
print -deps displayBrightness.eps

