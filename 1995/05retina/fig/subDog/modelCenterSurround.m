%
%	Make the Gaussian Center surround curves
%
cd /home/brian/book/04retina/fig/subDog

x = [1:128] - (length(x)/2);
center = mkGaussKernel(size(x),[1 4]);
surround = mkGaussKernel(size(x), [1 24]);
m = max(center)
center = center/m;
surround = surround/m;

p = plot(x,center,'-',x,-1*surround,'--')
set(p,'linewidth',2)
set(gca,'fontname','Bookman','fontsize',16)
grid on
set(gca,'xtick',[-50:25:50],'ytick',[-.2:.2:1], ...
        'xlim',[-50 50],'ylim',[-.4 1.1])
print -deps spatial.eps
