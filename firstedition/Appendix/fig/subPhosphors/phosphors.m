%
%	Make a pair of plots of the monitor SPDs
%
cd /wusr5/brian/book/11app/fig/subPhosphors

load hit489
xtick = [400 500 600 700];
ytick = [0:.2:1];
wave = 370:730;
wgts = [.8 1 .5]';
hit489 = hit489*diag(wgts);
m = mmax(hit489);
hit489 = hit489/m;

r = hit489(:,1);
g = hit489(:,2);
b = hit489(:,3);


p = plot(wave,r,'r-',wave,g,'g--',wave,b,'b:');
set(gca,'xtick',xtick,'xticklabels',[],'ytick',ytick,'yticklabels',[]);
set(p,'linewidth',2)
grid on

print -depsc partA.eps

p = plot(wave,r+g+b,'w-');
set(gca,'xtick',xtick,'xticklabels',[],'ytick',ytick,'yticklabels',[])
set(p,'linewidth',2)
grid on

print -depsc partB.eps

