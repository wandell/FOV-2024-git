%
%
cd /wusr5/brian/book/06space/fig/subRobson

clear all
load robsonData

plotParms(plot(sf1,sens1,'w-',sf1,sens1,'wo', ...
	sf6,sens6,'w-',sf6,sens6,'wo', ...
	sf16,sens16,'w-',sf16,sens16,'wo', ...
	sf22,sens22,'w-',sf22,sens22,'wo'))

set(gca,'xscale','log','yscale','log','xlim', [.2 50],'ylim',[2 500])
set(gca,'xtick', [0.1 .2 .5 1 2 5 10 20 50], ...
	'ytick', [1 2 5 10 20 50 100 200 500])
grid on
print -deps robsonData.eps

%
%
plotParms(plot(sf1,sens1,'w-',sf1,sens1,'wo'))
plotParms(plot(sf6,sens6,'w-',sf6,sens6,'wo'))
plotParms(plot(sf16,sens16,'w-',sf16,sens16,'wo'))
plotParms(plot(sf22,sens22,'w-',sf22,sens22,'wo'))

