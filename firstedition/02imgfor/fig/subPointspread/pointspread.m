%
%	Pointspread pictures
%
cd /home/brian/book/01imgfor/fig/subPointspread

x = -15:16;
range = [-16 16];

%x = -23:24;
%range = [-24 24];

y = x;
kernelSize = [length(x) length(y)];
sd = [4 4];
ps = mkGaussKernel(kernelSize,sd);
n = 11;
shift = zeros(n,n);
shift(n,1) = 1.0;
ps2 = filter2(shift,ps);

subplot(1,1,1)
colormap(ones(32,3));

mesh(x,y,ps);
set(gca,'xlim',range,'ylim',range,'zTickLabels',[])
print -dill singlePoint.ill
print -deps singlePoint.eps

mesh(x,y, (ps+ps2))
set(gca,'xlim',range,'ylim',range,'zTickLabels',[])
print -dill twoPoints.ill
print -deps twoPoints.eps


