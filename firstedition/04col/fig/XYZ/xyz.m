%
%	XYZ bar figure
%
% Modified 12.19.95 , BW
%
cd /wusr5/brian/book-/04col/fig/subXYZ

% changeDir('/usr/local/matlab/toolbox/stanford/color/data')
% load -ascii Sources/xyz.dat
% wave = xyz(:,1);
% xyz = xyz(:,2:4);
% save xyz1931 wave xyz

load xyz1931

% Only plot a shortened wavelength range
%
nWave = length(wave);
p = plot(wave,xyz(:,:))
plotParms(p);
set(gca,'xgrid','on','ygrid','on', ...
	'xtick',[300 400 500 600 700 800], ....
	'ytick',[0:.2:1.8], ...
        'xlim',[350 750],'ylim',[0 1.8]);

print -deps XYZ.eps
print -dill XYZ.ill
