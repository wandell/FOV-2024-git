% Make some cool metamers



% Stockman Sharpe fundamentals
load snsCones
comment
wavelength


% Gaussian spectrum
gSpectra = mkGaussKernel([1 length(wavelength)],[1 60]);
plot(gSpectra)

% Standard display
% 
load displaySPD; comment
