%
% Here are the calculations of the otf functions based on the
% scripts in papers/chromAb/matlab
%

!printarg 1 370 730 1 0 32 1 0.0015 > cmd.otf
!otf -icmd.otf > otf.cmat
otf = readcap('otf.cmat','CapMatrix');
wave = 370:1:730;
plotRange = 1:5:361;
sf = 1:33;		%Used as an index into matlab entries
sampleSf = 0:32;	%Real spatial frequencies
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Calculation of combined OTF using Williams et al. formula
%	instead of the old stray light one.  In Williams et al.
%	They predict the MTF at the infocus wavelength by multiplying times
%	a weighted exponential.  We calculate that exponential
%	here and multiply it times the MTF at every wavelength.
%

a =  0.1212;		%Parameters of the fit
w1 = 0.3481;		%Exponential term weights
w2 = 0.6519;
williamsFactor =  w1*ones(size(sampleSf)) + w2*exp( - a*sampleSf );
combinedOtf = otf*diag(williamsFactor);
save combinedOtf combinedOtf

