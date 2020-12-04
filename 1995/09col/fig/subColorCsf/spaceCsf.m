%
%	Make a plot of Allen's spatial mechanism
%	sensitivities.  Use these rather than
%	Mullen's because
%	1.  Unlike Anderson, they are in the fovea
%	2.  Unlike Mullen's they do not correct for
%		chromatic aberration
%	3.  They make sense.

cd /home/brian/book/09col/fig/subColorCsf

load spaceCsf

p = plot(spFreq,spSens(:,1),'w-', ...
     spFreq,spSens(:,2),'r-', ...
     spFreq,spSens(:,3),'b-', ...
     spFreq,spSens(:,1),'w+', ...
     spFreq,spSens(:,2),'r+', ...
     spFreq,spSens(:,3),'b+');
grid on
set(gca,'xscale','log','yscale','log','xlim',[0 10],'ylim',[ .05 2])
set(gca,'xtick',[0.2 .5 1 2 4 8],'ytick',[.1 .2 .5 1 2])
axis square
plotParms(p)
print -depsc spaceCsf.eps

%
%	Now make little insets of the spectral sensitivities
%	of the spatial mechanisms
%

load ncones
wave = 370:730;
mechSS = ncones*cMech;
m = max(abs(mechSS))
mechSS = mechSS * diag(1 ./ m);

for i=1:3
 p = plot(wave,mechSS(:,i),'-');
 plotParms(p);
 xtick = [400:50:700];
 ytick = [-1:0.5:1.0];
 set(gca,'xlim',[400 700],'ylim',[-1.1  1.1],'xtick',xtick,'ytick',ytick)
 grid on
 fname = sprintf('mech%d.ill',i);
 command = ['print -deps ' fname];
 command = ['print -dill ' fname];
 eval(command)
 pause
end



