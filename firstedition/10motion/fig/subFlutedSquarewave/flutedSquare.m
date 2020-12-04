x = 0:.02:2;
f4 = cos(2*pi*4*x);
colormap(gray(128))

phase = [0:.125:1]*2*pi;
nImage = length(phase);
f3 = zeros(nImage,length(x));
for i=1:nImage
 f3(i,:) = cos(2*pi*3*x - phase(i));
end
tmp = ones(nImage,1)*f4;
flute = f3 + tmp;

%
%	This is good.  It is shifted to the
%	right at every boundary, but never gets anywhere
%

subplot(1,3,1)
imagesc(f4)
axis off;

subplot(1,3,2)
imagesc(f3)
axis off

subplot(1,3,3)
imagesc(flute)
axis off;


subplot(1,3,3)
plot(flute(1,:))
set(gca,'xlim',[0 100])

subplot(1,3,2)
plot(flute(3,:))
set(gca,'xlim',[0 100])

subplot(2,2,4)
imagesc(f(2,:))
