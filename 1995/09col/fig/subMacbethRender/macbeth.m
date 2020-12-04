%
%	Put up an approximation to the macbeth chart
%
%	This needs some work because I just grabbed it out
%	of 08col/matlab/macbeth.m without neatening it up
%	for this purpose.  -- BW
%
cd /home/brian/images/util

load macbethChart; load D65; load XYZ
%load hit489; load hit489Gam
load sanyoLCD; load sanyoLCDGam
wave = 370:730;

%
%	Pick a light
%
lgt = D65;

%
macbethImage = reshape(1:24,6,4)
macbethImage = fliplr(macbethImage);
%
% XYZ = XYZ'* sanyoLCD*linearRGB
%
macbethXYZ = XYZ'* diag(lgt)* macbethChart;
%
% white is 19
%
%	Display the Macbeth Chart
%
macbethLinearRGB = inv(XYZ'* sanyoLCD)*macbethXYZ;
macbethLinearRGB = round(1000*macbethLinearRGB/(mmax(macbethLinearRGB)));
macbethLinearRGB = max(1, macbethLinearRGB);
macbethRGB =  sanyoLCDGamInv(macbethLinearRGB);
%
macbethColorMap = macbethRGB/255;
macbethImage = reshape(25:48,6,4)
macbethImage = fliplr(macbethImage);

wht = macbethLinearRGB(:,19);
macbethLinearRGB = diag( (1 ./ wht )  ) * macbethLinearRGB;

macbethLinearRGB = round(1000*macbethLinearRGB/(mmax(macbethLinearRGB)));
macbethLinearRGB = max(1, macbethLinearRGB);
macbethRGB =  sanyoLCDGamInv(macbethLinearRGB);
macbethColorMap = [macbethColorMap macbethRGB/255];
image(macbethImage); 
axis image, axis off
colormap(macbethColorMap')

mp = (macbethRGB/255)'
X = fliplr(rot90(macbethImage)) - 24
image(X)
axis off, axis image
colormap(mp)
tiffwrite(X,mp,'macbethImage.tif')
disp('macbeth is done:  macbethImage.tif is written out.')
