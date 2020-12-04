%
%	Values from the Schiller and Malpeli paper
%
cd /home/brian/book/04retina/fig/subConduction

parvo = [0 2 7 37 6];
magno = [3 25 14 0 0];

bar(parvo)
set(gca,'ylim',[0 40],'ytick',[0:10:40], ...
        'xticklabels',[],'yticklabels',[]);
print -deps parvoLatencies

bar(magno)
set(gca,'ylim',[0 40],'ytick',[0:10:40], ...
        'xticklabels',[],'yticklabels',[]);
print -deps magnoLatencies

