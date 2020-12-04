%
%	Figures for the Wassef data analysis
%
cd /home/brian/book/08col/fig/subWassef
load xyz; load ncones; load cieabc
xyz2ncones = XYZ \ ncones

%
%	Load raw data and convert to Smith-Pokorny
%
load -ascii wassefData/table1.dat
table1 = table1*xyz2ncones
illaT = table1(1:10,:)
illaM = table1(11:20,:)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	wassefVK
%
%	Affine fits, not precisely Von Kries,
%	through the data in cone coordinates
%

clf

%	Make the matrix for the affine fits
o = ones(size(illaT,1),1);

%  Make the max range for the cone absorptions
r = [.4 .4; .4 .4 ; .4 .4];
%
fits = zeros(2,3);

for i=1:3
% This is an affine fit, not linear
 fits(:,i) = [illaT(:,i),o]\illaM(:,i);
 sprintf('Cone class %d\n slope = %.4f intercept = %.4f\n',i,fits(1),fits(2))

% Make the range for the horizontal axis prediction curve
 mx = 1.2*max(illaT(:,i));
 x = 0:mx/50:r(i,1);
 plot(illaT(:,i),illaM(:,i),'+', ...
     x,fits(1,i)*x+fits(2,i),'-')
 grid on
 mx = 1.2*mmax([illaT(:,i) ; illaM(:,i)]);
 set(gca,'xlim',[0.0 r(i,1)],'ylim',[0.0 r(i,2)], ...
         'xtick',[0 .1 .2 .3 .4],'ytick',[0 .1 .2 .3 .4],...
	 'fontsize',24);

 disp('Press <Enter> to continue')
 pause

% fname = sprintf('wassef.%d',i), eval(['print -deps ' fname]);

end

%
%	Now, the next question is whether the affine
%	term in fits and the slopes in fits can be related
%	to the difference between the match and test illuminants.
%	
%	This is a start in thinking about it ...
%	Figure out the cone shifts .  Need to do more to make sense of it
%
conesA = ncones'*cieabc(:,1);
conesC = ncones'*cieabc(:,3);
coneDiff = (conesA - conesC) / max(coneDiff)
coneRatio = (conesA ./ conesC) / max(coneDiff)
%
%	Any ideas?
%
plot(coneDiff,fits(1,:)), grid on
plot(coneDiff,fits(2,:)), grid on

plot(coneRatio,fits(1,:)), grid on
plot(coneRatio,fits(2,:)), grid on
