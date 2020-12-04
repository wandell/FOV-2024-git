%
%	Plot the data
%
cd /wusr5/brian/book/06space/fig/subLocalization

load mckwest

% The data set contain two subjects in the first and 2nd columns
p = seplot(angle,offset, err)
plotParms(p)

grid on
xtick = [ 0:15:120];
ytick = [0:2:20];
xlim =  [0 100];
ylim =  [0 10];
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim)

print -deps mckwest.eps

