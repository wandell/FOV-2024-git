
pupil = 1.5; 				% diameter in mm
pigmentation = 0.142 			% Caucasian
freqIndexRange = 1:50; 			% The spatial frequency range

age = [20,30,40,50,60,70]; 				% Subject's age

angleInDeg = [-.5:.005:.5];
angleInSec = angleInDeg*3600;
angleInRad = deg2rad(angleInDeg);

  [iMTF, iPSF, iLSF1] = ijspeert(5, pupil, pigmentation, ...
      freqIndexRange, angleInRad);
  [iMTF, iPSF, iLSF2] = ijspeert(70, pupil, pigmentation, ...
      freqIndexRange, angleInRad);
  max(iLSF1-iLSF2)
  
  plot(iLSF1,iLSF2)
  
plot(iLSF20,iLSF1)  
  
clf
for ii = 1:length(age)
  [iMTF, iPSF, iLSF] = ijspeert(age(ii), pupil, pigmentation, ...
      freqIndexRange, angleInRad);
  semilogx(freqIndexRange,iMTF); hold on
end

set(gca,'xtick',[1 2 4 8 16 32 64],'xlim',[0 64]);
xlabel('Spatial frequency (cpd)');
ylabel('Amplitude');
title('MTF (IjSpeert)')
grid on
print -dill IjSpeertAge.ai
