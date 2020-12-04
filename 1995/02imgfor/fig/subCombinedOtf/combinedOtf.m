%
%  Chromatic aberration surface plot
%
%  The data are created in the file makeCombined.m in this directory.
%  The main matlab files, from which this is extracted, is in
%  papers/chromAb/matlab
%  
cd /home/brian/book/02imgfor/fig/subCombinedOtf
load combinedOtf

wave = 370:1:730;
plotRange = 1:5:361;
sf = 1:33;              %Used as an index into matlab entries
sampleSf = 0:32;    %

subplot(1,1,1)
m = mesh(sampleSf,wave(plotRange),combinedOtf(plotRange,:))
az = 40;
el = 30;
view([az el])
set(gca,'Zlim',[-0.2,1.0],'Xlim',[0,35],'Ylim',[370 730]);
set(m, 'EdgeColor',[1 1 1]);
set(m, 'FaceColor',[ 0 0 0]);
xlabel('Spatial Frequency')
ylabel('Wavelength')
title('OTF of Human Eye')
%print -dpsc -Pdeskjet
%f = sprintf('combined otf (par = %.3f)',a);
%title(f);
orient landspace
print -deps combinedOtf.eps
orient portrait
print -dill combinedOtf1.ill

az = 150;
el = 30;
view([az el])
set(gca,'Zlim',[-0.2,1.0],'Xlim',[0,35],'Ylim',[370 730]);
set(m, 'EdgeColor',[1 1 1]);
set(m, 'FaceColor',[ 0 0 0]);
xlabel('Spatial Frequency')
ylabel('Wavelength')
title('OTF of Human Eye')
%print -dpsc -Pdeskjet
%f = sprintf('combined otf (par = %.3f)',a);
%title(f);
orient landspace
print -deps combinedOtf.eps
orient portrait
print -dill combinedOtf2.ill

%
%	Get the otf variable from somewhere!
%
%!printarg 1 370 730 1 0 32 1 0.0015 > cmd.otf
%!otf -icmd.otf > otf.cmat
%otf = readcap('otf.cmat','CapMatrix');
%save otf otf

load otf

subplot(1,1,1)
indexInFocus = find( wave == 580);
diffractionLimit = otf(indexInFocus,:);
inFocusCombined = combinedOtf(indexInFocus,:);

plot(	sampleSf,inFocusCombined,':', ...
	sampleSf,diffractionLimit,'-.');
set(gca,'Ylim',[0,1]);
%f = sprintf('In Focus Wavelength: a = %.3f p = %.3f',a,p);
%title(f);
print -deps inFocus
print -dill inFocus.ill



