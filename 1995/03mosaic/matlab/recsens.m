cd /wusr5/brian/book/02mosaic/fig/subRecSens

load ncones
wave = 370:730;
plot(wave,ncones(:,1),'r-', ...
     wave,ncones(:,2),'g-', ...
     wave,ncones(:,3),'b-')
set(gca,'xtick',[400:50:700],'ytick',[0:.2:1],...
        'ylim',[-.05 1.1]);
xlabel('Wavelength (nm)')
ylabel('Normalized responsivity')
print -dpsc -Pdeskjet


plot(wave,ncones(:,1),'r-', ...
     wave,ncones(:,2),'g-', ...
     wave,ncones(:,3),'b-')
set(gca,'xtick',[400:50:700],'ytick',[0:.2:1],...
        'ylim',[-.05 1.1]);
set(gca,'xticklabels',[],'yticklabels',[],'GridLineStyle',':','LineWidth',1)

print -deps recsens.eps
