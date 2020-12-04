%
%	Make some curves for the csf.convolution figure
%
cd /wusr5/brian/book/06space/fig/subCsf

support = 96;
center = 7;
surround = 14;
g = mkGaussKernel([1 support],[1 center]) - mkGaussKernel([1 support],[ 1 surround]);
plot(g);
set(gca,'xlim',[1 support])
axis off
