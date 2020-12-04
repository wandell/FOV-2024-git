%
%	virsu and rovamo eccentricity data plot
%
cd /home/brian/book/06space/fig/subEccentricity

% First make panel (a), the raw eccentricity curves
%
%	The data are separated out into separate curves named
% pi in the file referring to measurements at different eccentricities.
%
load eccentricity

p = loglog(p1(:,1),p1(:,2),'+', ...
	   p1(:,1),p1(:,2),'-', ...
	   p2(:,1),p2(:,2),'+', ...
	   p2(:,1),p2(:,2),'-', ...
	   p3(:,1),p3(:,2),'+', ...
	   p3(:,1),p3(:,2),'-', ...
	   p4(:,1),p4(:,2),'+', ...
	   p4(:,1),p4(:,2),'-', ...
	   p5(:,1),p5(:,2),'+', ...
	   p5(:,1),p5(:,2),'-', ...
	   p6(:,1),p6(:,2),'+', ...
	   p6(:,1),p6(:,2),'-');

xtick = [1 2 5 10 20 50 100];
ytick = [1 2 5 10 20 50 100];
xlim =  [.5 100]
ylim =  [.8 200]
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim)
grid on
axis square
plotParms(p);
print -deps eccentricity.eps

%
%	Then, make panel (b), the M-scaled measurements
%
p = loglog(s1(:,1),s1(:,2),'+', ...
	   s1(:,1),s1(:,2),'-', ...
	   s2(:,1),s2(:,2),'o', ...
	   s2(:,1),s2(:,2),'-', ...
	   s3(:,1),s3(:,2),'o', ...
	   s3(:,1),s3(:,2),'-', ...
	   s4(:,1),s4(:,2),'x', ...
	   s4(:,1),s4(:,2),'-', ...
	   s5(:,1),s5(:,2),'*', ...
	   s5(:,1),s5(:,2),'-');


xtick = [.1 .2 .5 1 2 5 10 20 50 100];
ytick = [1 2 5 10 20 50 100];
xlim =  [.1 10]
ylim =  [.8 200]
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim)
grid on
axis square
plotParms(p);
set(p(3),'linewidth',4)	%Fills one circle
set(p(5),'markersize',8)	
print -deps scaled.eps


%
%	Just checking the individual graphs
%
r = 1:2;
p1 = eccentricity(r,:)

r = 3:6;
p2 = eccentricity(r,:)
loglog(p2(:,1),p2(:,2),'+')

r = 7:12;
p3 = eccentricity(r,:)
loglog(p3(:,1),p3(:,2),'+')

r = 13:19;
p4 = eccentricity(r,:)
loglog(p4(:,1),p4(:,2),'+')

r = 20:28;
p5 = eccentricity(r,:)
loglog(p5(:,1),p5(:,2),'+')

r = 29:38;
p6 = eccentricity(r,:)
loglog(p6(:,1),p6(:,2),'+')

