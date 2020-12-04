%
%	Make a pair of blue phosphor images
%
cd /home/brian/book/02mosaic/fig/subBluePhosphor

wave = 400:10:700;
fineWave = 400:700;





b1 = zeros(size(wave));
b1(3:7) = mkGaussKernel([1 5],[1 2]);
b1 = min(1,max(0,interp1(wave,b1,fineWave,'linear')));

b2 = zeros(size(wave));
b2(3:11) = mkGaussKernel([1 9],[1 5])
b2 = min(1,max(0,interp1(wave,b2,fineWave,'linear')));

plot(fineWave,b1)
set(gca,'xlim',[370 730],'ylim',[0 .35],'xticklabels',[],'yticklabels',[])
print -deps b1.eps

plot(fineWave,b2)
set(gca,'xlim',[370 730],'ylim',[0 .35],'xticklabels',[],'yticklabels',[])
print -deps b2.eps

