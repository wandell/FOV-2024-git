%
%	Use the Joe Montana image to create examples
%	of neural images.
%

cd /wusr5/brian/book/Edits/subNeuralImage

[joe mp] = tiffread('montana.tif');
joe = mp(joe);
colormap(gray(64))
imagesc(joe)
axis image; axis off

% Make a blurred version of the image
g = mkGaussKernel([15 15], [9 9]);
joeBlur = conv2(joe,g,'same');
colormap(gray(128))
mp = colormap;
imagesc(joeBlur)
axis image; axis off
joeBlur = scale(joeBlur, 1,128);
tiffwrite(joeBlur,mp,'joeBlur.tiff');

% Find the edges
% default was .13
joeEdge = edge(joe);
joeEdge = scale(joeEdge,1,128);
image(joeEdge)
tiffwrite(joeEdge,mp,'joeEdge.tif');
%
%	Here is an oriented version
%
g = mkGaussKernel([15 15], [9 1]) - mkGaussKernel([15 15], [2 1]);
joeVertical = conv2(joe,g,'same');
m1 = mmin(joeVertical)
m2 = mmax(joeVertical)
joeVertical  = (joeVertical - m1) ./ (m2 - m1);
imagesc(joeVertical)
colormap(gray(64))
axis image; axis off
tiffwrite(64*joeVertical,gray(64),'joeVertical.tiff');

g = mkGaussKernel([15 15], [1 9]) - mkGaussKernel([15 15], [1 2]);
joeHorizontal = conv2(joe,g,'same');
m1 = mmin(joeHorizontal)
m2 = mmax(joeHorizontal)
joeHorizontal  = (joeHorizontal - m1) ./ (m2 - m1);

colormap(gray(64))
imagesc(joeHorizontal)
axis image; axis off
tiffwrite(64*joeHorizontal,gray(64),'joeHorizontal.tiff');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	This is a way to paste in different resolutions
%	Didn't look dramatic enough in the image.
%	It might look good in a bigger slide format, though.
%
g = mkGaussKernel([10 10], [3 3]);
joe2= conv2(joe,g,'same');
colormap(gray(64))
imagesc(joe2)
axis image; axis off

joe3 = joe2;
r1 = 10:70;
r2 = 40:110;
joe3(r1,r2) = joe1(r1,r2);

r1 = 30:70;
r2 = 60:100;
joe3(r1,r2) = joe(r1,r2);
imagesc(joe3)
axis image; axis off

tiffwrite(64*joe3,gray(64),'joeBlur.tiff');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%
%	Make a quiver plot of the dx, dy values in the image
%
x = 1:4:size(joe,1);
y = 1:4:size(joe,2);
quiver(x,y,joeHorizontal(x,y), joeVertical(x,y))

