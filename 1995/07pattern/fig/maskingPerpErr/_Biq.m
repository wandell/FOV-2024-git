% Slides for Joyce's image quality presentations.

% 1. The photopic luminance curve

load xyz
plot(wavelength,XYZ(:,2),'-')
grid on
xlabel('Wavelength (nm)')
ylabel('Responsivity')
set(gca,'xlim',[350 750]);
print -deps photopic.eps

% 2.  The XYZ functions

plot(wavelength,XYZ(:,1),'r-', ...
    wavelength,XYZ(:,2),'g-', ...
    wavelength,XYZ(:,3),'c-')
grid on
set(gca,'xlim',[350 750]);
xlabel('Wavelength (nm)')
ylabel('Responsivity')
print -depsc cmf.eps

% 3.  Temporal CSF (tCSF)

% 4.  White noise:  Same noise at different amplitudes
% 
imSize = 128; 
wNoise = randn(imSize);
m = mean(wNoise(:))
wNoise = wNoise - m;

nGray = 128; 
wNoise1 = (wNoise*0.2 + 0.5)*128;
wNoise2 = (wNoise*0.1 + 0.5)*128;
trueShow(wNoise1,gray(nGray));
trueShow(wNoise2,gray(nGray));

tiffwrite(wNoise1,gray(nGray),'noise1.tif');
tiffwrite(wNoise2,gray(nGray),'noise2.tif');
unix('xv noise?.tif &')

% 5.  Same power spectrum, but scrambled.
load einstein
[r c] = size(X);
albert = reshape(map(X,1),r,c);
albert = scale(albert,30,226);
map = gray(256);
trueShow(albert,map);
tiffwrite(albert,map,'albert.tif');

alFFT = fft2(albert);

alAbs = abs(alFFT);
alAng = angle(alFFT);
% f = alFFT(20,70);
% abs(f -  (abs(f)* exp(i*angle(f))))
% reCalc = real(ifft2(alAbs .* exp(i*alAng)));
% imagesc(reCalc), colormap(map), axis image

rand('seed',0); 
rFFT =  fft2(randn(size(albert)));
rAbs = abs(rFFT);
rAng = angle(rFFT);

swappedAng = real(ifft2(alAbs .* exp(i*rAng)));
swappedAng = scale(swappedAng,1,256); 
imagesc(swappedAng), colormap(map),axis image;
tiffwrite(swappedAng,map,'swappedAng.tif');

swappedAbs = real(ifft2(rAbs .* exp(i*alAng)));
swappedAbs = scale(swappedAbs,1,256); 
image(swappedAbs), colormap(map),axis image;
tiffwrite(swappedAbs,map,'swappedAbs.tif');

%  unix('xv swappedA??.tif &');

% 6.  Original compared to (a) scaled copy of itself added in and
% (b) scaled copy of itself with the phase scrambled added in.

s = 0.25;
maskedErr = s * (albert - mean(albert(:)));
maskedAlbert = truncate(albert + maskedErr,1,256);
tiffwrite(maskedAlbert,gray(256),'maskedAl.tif');

subplot(1,2,1), image(albert),colormap(map); axis image
subplot(1,2,2), image(maskedAlbert),colormap(map); axis image

% Create albert with an essentially perpendicular error
% by scramble the phase in albert and adding the result
rand('seed',0);
aFFT =  fft2(s*albert); aAbs = abs(aFFT); aAng = angle(aFFT);
rFFT = fft2(randn(size(albert))); rAng = angle(rFFT);

perpErr = real(ifft2(aAbs .* exp(i*rAng)));
perpErr = perpErr - mean(perpErr(:));
perpAlbert = truncate(albert + perpErr,1,256);
tiffwrite(perpAlbert,gray(256),'perpAl.tif');

subplot(1,2,1), image(albert),colormap(map); axis image
subplot(1,2,2), image(perpAlbert),colormap(map); axis image

unix('xv maskedAl.tif perpAl.tif & ')

% Look at the contrast/error images
% 
subplot(2,2,1), image(maskedErr + 128),colormap(map); axis image
tiffwrite(maskedErr + 128,map,'maskedErr.tif'); 
subplot(2,2,2), image(perpErr + 128),colormap(map); axis image
tiffwrite(perpErr + 128,map,'perpErr.tif'); 
subplot(2,2,3)
foo = scale(log10(abs(fft2(maskedErr + 128))),1,256);
imagesc(foo),axis image
tiffwrite(foo, map,'maskedErrFFT.tif');
subplot(2,2,4)
foo = scale(log10(abs(fft2(perpErr + 128))),1,256);
imagesc(foo), axis image
tiffwrite(foo, map,'perpErrFFT.tif');

% The angle deg between the original and the error is nearly
% perpendicular. 
360/(2*pi)*acos((perpErr(:)'*albert(:)) / (norm(perpErr,2)*norm(albert,2))) ...
    - 90*(2*pi)/360

unix('xv *.tif &');
