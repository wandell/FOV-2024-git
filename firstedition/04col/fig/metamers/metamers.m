% Make some cool metamers

changeDir('/home/brian/slides/fov/04/metamers')

% Stockman Sharpe fundamentals
load snsCones
comment
wavelength
nWave = length(wavelength)

% Gaussian spectrum
gSpectra = mkGaussKernel([nWave 1],[60 1]);
gSpectra = scale(gSpectra,0,1);
plot(wavelength,gSpectra)

% Monochromatic lines
% 
mBasis = zeros(nWave,3);
mBasis(50,1) = 1; mBasis(150,2) = 1; mBasis(250,3) = 1;
plot(wavelength,mBasis)


% Standard display
% 
load displaySPD; comment


% Print the Gaussian spectrum
% 
plot(wavelength,gSpectra)
print -deps gaussS.eps
set(gca,'ylim',[0 2]);

% Match the display spectra to the Gaussian
% 
rgb2sns = snsCones'*displaySPD;
sns2rgb = inv(rgb2sns);
dSpectra = displaySPD*sns2rgb*snsCones'*gSpectra;
plot(wavelength,dSpectra)
set(gca,'ylim',[0 2]);
print -deps displayS.eps

% Match the line spectra to the Gaussian
% 
line2sns = snsCones'*mBasis;
sns2line = inv(line2sns);
lSpectra = mBasis*sns2line*snsCones'*gSpectra;
plot(wavelength,lSpectra)
set(gca,'ylim',[0 100]);
print -deps lineSpectra.eps
