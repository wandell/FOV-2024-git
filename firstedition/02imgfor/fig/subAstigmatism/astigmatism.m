%
%	Astigmatism plot, make a Gaussian with some covariance
%
%	Redo this to get rid of the axis
%
cd /home/brian/book/01imgfor/fig/subAstigmatism

x = -23:24;
y = x;
kernelSize = [length(x) length(y)];
sd = [3 5];
ps = mkGaussKernel(kernelSize,sd);

subplot(1,1,1)
range = [-24 24];
colormap(ones(64,3));
mesh(x,y,ps);
set(gca,'xlim',range,'ylim',range,'zlim',[0 mmax(ps)*1.1],'zTickLabels',[])
print -dill astigmatism.ill
print -deps astigmatism.eps



