%
%	Make an aliasing picture
%
cd /home/brian/book/02mosaic/fig/subAliasing
%
% Make images for the equations on aliasing ca. p. 62
%
N = 32
Nyquist = (N/2);
f = 8;		
%
%	Make the finely sampled versions for plotting
%
k=0:.05:N-1;
fineX = k/N;
fine1 = cos( 2* pi * (Nyquist + f) * fineX)';
fine2 = cos( 2* pi * (Nyquist - f) * fineX)';
%
%	Make the sampled versions
%
k = 1:N-1;
coarseX = k /N;
c1 = cos( 2* pi * (Nyquist + f) * coarseX)';
c2 = cos( 2* pi * (Nyquist - f) * coarseX)';

%	Sample Positions times a factor for plotting
samples = -1.2*ones(length(coarseX),1);

subplot(1,1,1)
plot(fineX, fine1,'-',...
     coarseX,samples,'wx');
set(gca,'xlim',[-0.0 .25],'ylim',[-1.2 1.1])
axis off
print -deps aliasA

plot(fineX, fine2,'-',...
     coarseX,samples,'wx');
set(gca,'xlim',[-0.0 .25],'ylim',[-1.2 1.1])
axis off
print -deps aliasB

plot(coarseX,c1,'*',...
     coarseX,samples,'wx');
set(gca,'xlim',[-0.0 .25],'ylim',[-1.2 1.1])
print -deps aliasC

plot(coarseX,c2,'*', ...
     coarseX,samples,'wx');
set(gca,'xlim',[-0.0 .25],'ylim',[-1.2 1.1])
print -deps aliasD



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Make an image for class
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 96;
x = 1:N;
Nyquist = N/2;
[X Y] = meshgrid(1:N,1:N);

f = 3*N/4;
im1 = sin(2*pi*(Nyquist + f)*X/N);
im2 = sin(2*pi*(Nyquist - f)*X/N);
colormap(gray(32));

subplot(2,2,1)
imagesc(im2)

subplot(2,2,2)
imagesc(im2)

bigN = 4*N;
x = 1:bigN;
[X Y] = meshgrid(1:N,1:N);

p1 = sin(2*pi*(Nyquist + f)*x/bigN);
p2 = sin(2*pi*(Nyquist - f)*x/bigN);

subplot(2,2,3)
plot(x,p1), set(gca,'xlim',[1 bigN])

subplot(2,2,4)
plot(x,p2), set(gca,'xlim',[1 bigN])


print
