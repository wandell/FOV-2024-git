%
%	Make a decent contrast effect.
%	Same target, but one is an increment on the local background and
%	the other is a decrement on the local background.
%
cd /home/brian/book/09col/fig/subContrast

target = ones(10,10)*201;		%square
background = ones(100,200);	%rectangle
background = background*diag(1:200);

background(45:54,75:84) = target;
background(45:54,115:124) = target;

mp = [gray(200) ; 0.5 0.5 0.5];
testmp = ones(200,3)*.3;
testmp = [testmp ; 0.5 0.5 0.5];

image(background); 
colormap(mp)
axis image; axis off
set(gcf,'sharecolors','no')
tiffwrite(background,mp,'contrast.tiff');
print -deps contrast.eps
print -dps contrast.ps
colormap(testmp)
print -dps -Pg
%
%	For a class movie
%
for i=1:5
 colormap(mp);
 for j=1:3
  title(num2str(4-j))
  pause(1)
 end
 colormap(testmp)
 for j=1:3
  title(num2str(4-j))
  pause(1)
 end
end

%
%	Here is a way to make colored versions
%
r = .4
g = .3
b = 1
mp = [gray(200); 0.5 0.5 0.5]*diag([r g b]);
colormap(mp); brighten(0.4)

mp = [gray(200)*diag([1 .7 .9]) ; 0.5 0.5 0.5];
mp = [gray(200)*diag([.3 .3 1]) ; 0.5 0.5 0.5];
mp = [gray(200)*diag([.3 1 .3]) ; 0.5 0.5 0.5];

print -Pdeskjet

