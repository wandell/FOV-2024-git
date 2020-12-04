%
%	Work on the example of quanta summing.
%	Basically, I think that the sampling is most
%	important so I will work on explaining that before
%	I will do this kind of stuff
%
cd /home/brian/book/11app/fig/subGeisler

colormap(gray(128))
mp = colormap;

width = 6;				%In minutes of arc
x = [-width/2:(1/60):width/2];		%Sample positions spaced 1 sec
coneWidth = 30;				%Cone width in SAMPLES

% Compute the pointspread of the eye from Westheimer.  There should be
% a formula for this in his article.  Don't do it this way in the future.
%
ls = lineSpread(x);	%The argument is sampled in minutes of arc.
p = plot(x,ls)		%Should look smooth and go to zero

nPts = length(ls);
stimA = zeros(nPts,nPts);
for i=1:nPts
  stimA(i,:) = ls;
end
stimA = stimA + 1;		%I add one to avoid div by zero later.

imagesc(stimA)
X = scale(stimA,64,128);
image(X); axis image;
set(gca,'gridlinestyle',':')
set(gca,'xtick',[1:coneWidth:nPts],'ytick',[1:coneWidth:nPts], ...
         'xticklabels',[],'yticklabels',[])
grid on
[X mp] = capture(1);
tiffwrite(X,mp,'stimA.tif');

%  Make a shifted copy
% 
left = zeros(size(stimA));
right = zeros(size(stimA));
sep = 30;		%in seconds
for i=1:nPts
  left(i,:) = vecRotate(stimA(i,:),sep/2,'l');
end
for i=1:nPts
  right(i,:) = vecRotate(stimA(i,:),sep/2,'r');
end
stimB = 0.5*(left + right);

X = scale(stimB,64,128);
image(X); axis image;
set(gca,'gridlinestyle',':')
set(gca,'xtick',[1:coneWidth:nPts],'ytick',[1:coneWidth:nPts],'xticklabels',[],'yticklabels',[])
grid on
[X mp] = capture(1);
tiffwrite(X,mp,'stimB.tif');
p =plot(x,stimB(:,1));


bayesClassifier = zeros(size(stimA));
bayesClassifier =  log10(stimB ./ stimA );

X = scale(bayesClassifier,1,128);
image(X); axis image;
set(gca,'gridlinestyle',':')
set(gca,'xtick',[1:coneWidth:nPts],'ytick',[1:coneWidth:nPts],...
	'xticklabels',[],'yticklabels',[])
grid on
[X mp] = capture(1);
tiffwrite(X,mp,'bayesClassifier.tif');

%	Make the x-y graph of the classifier cross-section
%


plotRange = 10:(nPts-10);

p = plot(stimA(1,plotRange));
plotParms(p);
axis off
print -deps oneLine.eps

p = plot(stimB(1,plotRange));
plotParms(p);
axis off
print -deps twoLine.eps

p = plot(bayesClassifier(1, plotRange));
plotParms(p)
axis off
print -deps bayesClassifier.eps

