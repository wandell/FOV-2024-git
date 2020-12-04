%
%	Do some of the image compression calculation
%
cd /wusr5/brian/book/08col/fig/subCompress

[fish mp] = rsread('fishSmall.ras');
image(fish), axis image, axis off
colormap(mp)

r = size(fish,1); c = size(fish,2);
f = reshape(fish,1,r*c);
rfish = mp(f,1);gfish = mp(f,2);bfish=mp(f,3);
rfish = reshape(rfish,r,c);
gfish = reshape(gfish,r,c);
bfish = reshape(bfish,r,c);

colormap(gray(200))
imagesc(rfish), axis image, axis off;
imagesc(gfish), axis image, axis off;
imagesc(bfish), axis image, axis off;

gam = 2.2;
igam = 1/gam;
%
%	Now, linearize the elements
%
rfish = rfish .^ gam;
gfish = gfish .^ gam;
bfish = bfish .^ gam;
%
%	Transform to the opponent coordinate frame
%
%  0.72L(\lambda) +  0.59M(\lambda) + 0.36S(\lambda) 
% -0.38L(\lambda) + -0.10M(\lambda) + 0.92S(\lambda) 
%  0.58L(\lambda) + -0.80M(\lambda) + 0.15S(\lambda)

cT = [ .72  .59 .36; ...
      -.38 -.1  .92; ...
       .58 -.80 .15];

rfish = reshape(rfish,1,r*c);
gfish = reshape(gfish,1,r*c);
bfish = reshape(bfish,1,r*c);
opponent = cT*[rfish; gfish; bfish];
wbfish = reshape(opponent(1,:),r,c);
byfish = reshape(opponent(2,:),r,c);
rgfish = reshape(opponent(3,:),r,c);

g = mkGaussKernel([10 10],[4 4]); 
mesh(g)

%wbfishg = conv2(wbfish,g,'same');
byfishg = conv2(byfish,g,'same');
rgfishg = conv2(rgfish,g,'same');

size(byfishg)
byfishg = reshape(byfishg,r,c);
rgfishg = reshape(rgfishg,r,c);
imagesc(byfishg(1:4:r,1:4:c));
colormap(redgreen(200))
imagesc(rgfishg(1:2:r,1:2:c)), axis image

%
%	Now, make some pictures of these intermediate steps
%
colormap(gray(200))
imagesc(wbfishg), axis image, axis off

colormap(redgreen(200))
imagesc(rgfishg), axis image, axis off

colormap(blueyellow(200))
imagesc(byfishg), axis image, axis off

%
%	Now, I need a way to create the 24 bit sun raster image
%	Get Rick to say how we did it.
%
wbfish = reshape(wbfish,1,r*c);
byfishg = reshape(byfishg,1,r*c);
rgfishg = reshape(rgfishg,1,r*c);
img = inv(cT)*[wbfish; byfishg; rgfishg];
img = img';
