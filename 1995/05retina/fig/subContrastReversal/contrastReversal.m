%
%	Image of a contrast reversing gratings:
%	contrastReversal.ps
%

cd /home/brian/book/05retina/fig/subContrastReversal

x = 0:.01:2;
t = 0:.01:2;
reversalGrating = zeros(length(x),length(t));
for i=1:length(t)
 reversalGrating(:,i) = (cos(2*pi*x)*cos(2*pi*t(i)))';
end

[r c] = size(reversalGrating);
mesh(reversalGrating(1:5:r,1:5:c))
set(gca,'yticklabels',[],'xticklabels',[],'zticklabels',[]);
set(gca,'zlim',[-2 2])
az = -57.5; el = 25;
view([az el])
grid on
colormap( (gray(128) + .2) *.8)
brighten(0.7)
print -deps contrastReversalMesh.eps
print -dill contrastReversalMesh.ill

%
%	Image of contrast-reversal grating
%
colormap(gray(128))
mp = colormap;
m = size(mp,1);
ireversalGrating = scale(reversalGrating,1,m);
image(ireversalGrating), axis image, axis off
tiffwrite(ireversalGrating,mp,'contrastReversalImage.tif');
%print -deps contrastReversalImg.eps

plot(reversalGrating(:,1))
set(gca,'ylim',[-1 1],'xlim',[0 200],'xticklabels',[],'yticklabels',[]);
print -deps sineA.eps
print -dill sineA.ill

plot(reversalGrating(:,26))
set(gca,'ylim',[-1 1],'xlim',[0 200],'xticklabels',[],'yticklabels',[]);
print -deps sineB.eps
print -dill sineB.ill

plot(reversalGrating(:,51))
set(gca,'ylim',[-1 1],'xlim',[0 200],'xticklabels',[],'yticklabels',[]);
print -deps sineC.eps
print -dill sineC.ill

%%%%%%%%%%%%%%%%%%%%%%%5
%
%	NOT USED.  And, I don't know what it is any more.
%
x = 0:.05:2;
t = 0:.05:2;
ph = [.33:.33:1] * pi
reversalGrating = zeros(length(x),length(t));
blank = ones(7,size(reversalGrating,2));

phaseGratings = [];
for j=1:length(ph)
 for i=1:length(t)
  reversalGrating(:,i) = (cos(2*pi*x + ph(j))*cos(2*pi*t(i)))';
 end
phaseGratings = [phaseGratings;reversalGrating;blank];
end
imagesc(phaseGratings)
axis off
print -deps phaseGratings
