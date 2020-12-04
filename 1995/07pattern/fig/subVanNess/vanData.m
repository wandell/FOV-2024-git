%
%	Data entered by Rezal, copied over here
%	and made into a figure, after screwing around, by BW.
%	
%	I am not sure where the 6.9 comes from in the calculation,
%	but I think it has to do with how Rezal scanned the figure.
%	The figure should probably be rescanned using DataThief on
%	the MAC and rebuilt, from scratch.
%
cd /home/brian/book/06space/fig/subVanNess
load -ascii vanData.mat

logSpatialFreq = vanData(:,8)/6.9 - 1;
nSpatialFreq = length(logSpatialFreq);

Illuminations = [0.0009 0.009 0.09 0.9 9.0 90.0 900.0];
nIlluminations = length(Illuminations);
logIlluminations = log10(Illuminations);

%
%	logModPercent contains 
%	  threshold as a fcn. of spatial frequency in each column
%	  threshold as a function of illumination in each row
%
%	logIlluminations are the log Illuminations
%	
nModPercent = nIlluminations;
for i = 1:nModPercent
 logModPercent (:,i) = vanData(:,i)/6.9 - 1;
end

SpatialFreq = 10.^ logSpatialFreq;
ModSensitivity = 10.^ (-logModPercent);
ModThreshold = 1 ./ ModSensitivity;
%
%	Once, I tried plotting linear amplitude sensitivity
%	instead of contrast sensitivity
%	ModSensitivity is contrast in percent, I think, so
%	to obtain the linear sensitivity, or amplitude, I multiplied by
%	the illumination level to get the amplitude at different
%	levels.
%
%	Can't do this 'cause of the NaN's in each row
%		Sensitivity = ModSensitivity*diag(Illuminations);
for i = 1:nIlluminations
  Threshold = ModThreshold(:,i)*Illuminations(i);
  Sensitivity(:,i) = ( 1 ./ Threshold);
end
%
%	In this case the spatial frequency
%	axis is running the wrong way, sigh.
%	So, I used the next one.
%
mp = 0.4*gray + .6;
%
m=surf(Illuminations, SpatialFreq, ModSensitivity);
set(gca,'FontName','Bookman')
set(gca,'FontSize',16)
axis ij
colormap(mp);
set(gca,'XScale','log','YScale','log','Zscale','log');
view(-105,30);
grid on
set(gca,'xtick',10.^[-4:2:4],'ytick',10.^[-1:1:2],'ztick',10.^[-2:1]);
print -deps vanNess.eps

%
%xlabel('Mean Illumination Levels');
%ylabel('SpatialFreq');
%zlabel('Threshold Sensitivity');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Now, make some graphs showing how contrast
%	threshold varies with mean illumination
%
list = [1 2 5];
SpatialFreq(list)
plot(Illuminations,ModSensitivity(list(1),:),'w-', ...
     Illuminations,ModSensitivity(list(2),:),'w:', ...
     Illuminations,ModSensitivity(list(3),:),'w--');
set(gca,'XScale','log');
set(gca,'YScale','log');
set(gca,'yticklabels',[],'xticklabels',[]);
print -deps lowSFvanNess.eps

list = [12 15 17] ;
SpatialFreq(list)
plot(Illuminations,ModSensitivity(list(1),:),'w-', ...
     Illuminations,ModSensitivity(list(2),:),'w:', ...
     Illuminations,ModSensitivity(list(3),:),'w--');
set(gca,'XScale','log');
set(gca,'YScale','log');
set(gca,'yticklabels',[],'xticklabels',[]);
print -deps highSFvanNess.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Now make a version with logModPercents as individual graphs
%
p = plot( ...	
	SpatialFreq,ModSensitivity(:,1),'w+', ...
	SpatialFreq,ModSensitivity(:,2),'w+', ...
	SpatialFreq,ModSensitivity(:,3),'w+', ...
	SpatialFreq,ModSensitivity(:,4),'w+', ...
	SpatialFreq,ModSensitivity(:,5),'w+', ...
	SpatialFreq,ModSensitivity(:,6),'w+', ...
	SpatialFreq,ModSensitivity(:,7),'w+', ...
	SpatialFreq,ModSensitivity(:,1),'w-', ...
	SpatialFreq,ModSensitivity(:,2),'w-', ...
	SpatialFreq,ModSensitivity(:,3),'w-', ...
	SpatialFreq,ModSensitivity(:,4),'w-', ...
	SpatialFreq,ModSensitivity(:,5),'w-', ...
	SpatialFreq,ModSensitivity(:,6),'w-', ...
	SpatialFreq,ModSensitivity(:,7),'w-');
set(gca,'XScale','log');
set(gca,'YScale','log');
set(gca,'xtick',10.^[-4:1:4],'ytick',10.^[-1:1:2]);
axis square
grid on
plotParms(p);
print -deps linePlotvanNess.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%
%	Alternative plot.  This time it is contrast
%	threshold in one plot and amplitude threshold
%	in the other.	This is nice because of the comparison
%	with the temporal flicker curves (kelly, etc.) which%	
%	will happen later.
%

xtick = [1 5 10 50 100];

subplot(1,1,1)
plot(SpatialFreq,ModSensitivity(:,1:7))
hold on
plot(SpatialFreq,ModSensitivity(:,1:7),'w.')
hold off
set(gca,'xscale','log','yscale','log',...
        'xlim',[min(SpatialFreq)*.9,100], ...
        'xtick',xtick)


plot(SpatialFreq,Sensitivity(:,1:i))
hold on
plot(SpatialFreq,Sensitivity(:,1:i),'w.')
hold off
set(gca,'xscale','log','yscale','log',...
        'xlim',[min(SpatialFreq)*.9,100], ...
        'xtick',xtick)




