%
%	Make a Cornsweet-Craik-O'Brien image
%
cd /home/brian/book/10ill/fig/subEdgeIllusion

%	Set up basic parameters
n = 256;
x = 0:(1/n):1-(1/n);
colormap(gray(200));
brighten(0.7)

% Build the squarewave
%
f = 1;
c1 = square(2*pi*f*x);

% Smooth the squarewave
g = mkGaussKernel([1,64],[1 20]);
c2 = filter2(g,c1,'same');
%plot(c1), hold on, plot(c2), hold off

% Subtract the smoothed from the original and build a
% contrast image centered around a medium gray.
amp = .2;
mn = .5;
c = amp*(c1 - c2) + mn;

% Set the range for drawing as an image
c = scale(c,1,128,0,1);
%plot(c), set(gca,'ylim',[1 128]);

% Get rid of the edges to avoid the convolution artifact.
X = c( n/4:(3*(n/4) - 1 ));
nX = length(X);

% Make graph of 1-d intensity
plot(X)
set(gca,'xlim',[1 128],'ylim', [0 128])
grid off
axis off
print -deps intensityGraph.eps

% Square up the image for writing as a tiff file.
X = X(ones(nX,1),:);
image(X)
axis image, axis off

% Write it out.
mp = colormap;
tiffwrite(X,mp,'edgeIllusion.tif');
