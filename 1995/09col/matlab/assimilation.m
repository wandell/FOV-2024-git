%
%	Make an assimilation picture
%
cd /home/brian/book/08col/fig/subSpace

t=-1:.01:1;
f = 6;
y = ones(50,1)*square(2*pi*f*t);
y = ScaleImage(y,16,50);

barWidth = 2;
barLength = 20;
barLightness = 0.55;

bar = 65*ones(barLength, barWidth);
%l = [46;88];
l = [63;88];
y(22:22+barLength-1, l(1):(l(1)+barWidth-1)) = bar;
y(22:22+barLength-1, l(2):(l(2)+barWidth-1)) = bar;

image(y), colormap([gray(64);barLightness*[1 1 1]]), axis image, axis off

print -dps assimlation
