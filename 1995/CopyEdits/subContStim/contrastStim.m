%
%	Make the sinusoids and their sums
%
cd /wusr5/brian/book/Edits/subContStim

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

colormap(gray(128))
X =scale(c1,1,128);
X = X(ones(20,1),:);
mp = colormap;
image(X)
tiffwrite(X,mp,'1cpd.tif');

plotParms(plot(x,c3))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps f3.eps

colormap(gray(128))
X =scale(c3,1,128);
X = X(ones(20,1),:);
mp = colormap;
image(X)
tiffwrite(X,mp,'3cpd.tif');

plotParms(plot(x,c1 + c3))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps peakAdd.eps

colormap(gray(128))
X =scale(c1 + c3,1,128);
X = X(ones(20,1),:);
mp = colormap;
image(X)
tiffwrite(X,mp,'peaksAdd.tif');

plotParms(plot(x,c1 - c3))
set(gca,'xtick',[-.5:.5:.5],'ytick',[-1:.25:1], 'ylim',s*[-2 2])
grid on
print -deps peakSub.eps

colormap(gray(128))
X =scale(c1 - c3,1,128);
X = X(ones(20,1),:);
mp = colormap;
image(X)
tiffwrite(X,mp,'peaksSub.tif');


