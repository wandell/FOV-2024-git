%
%	I scanned in the data and massaged it by hand to
%	get the variables written out in mollonDys and mollonNorm
%	There is no file record of this, as there usually is
%	for mkData.m
%
cd /home/brian/book/08col/fig/subMollon

%
%	The data have been rearranged from the original figure
%	so that wavelength now refers to test wavelength.  The
%	data are organized by field wavelength A (510nm) and B (640nm)
%
load mollonDys
load mollonNorm

xtick = 500:50:700;
ytick =-7:.5:-5;
xlim = [500 650];
ylim = [-7.5 -5.5];
%	Normal subject 1
%
p = plot(testW,jmF510,'+', ...
     testW,jmF640,'+', ...
     testW,jmF510,'-', ...
     testW,jmF640,'--');
plotParms(p);
grid on
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim);
print -deps jmData.eps

%	Normal subject 2
%
p = plot(testW,ppF510,'+', ...
     testW,ppF640,'+', ...
     testW,ppF510,'-', ...
     testW,ppF640,'--')
plotParms(p);
grid on
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim);
print -deps ppData.eps


%	Data from patient
%
p = plot(testW,msF510,'+', ...
     testW,msF640,'+', ...
     testW,msF510,'-', ...
     testW,msF640,'--')
plotParms(p);
grid on
set(gca,'xtick',xtick,'ytick',ytick,'xlim',xlim,'ylim',ylim);
print -deps msData.eps

%save mollonNorm testW jmF510 jmF640 ppF510 ppF640
%save mollonDys testW msF510 msF640
