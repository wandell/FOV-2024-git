%
%	Plot of Baylor Schnapf data
%
%	This section is the plot.  Below is the code that
%	I used to make the data figure from the scanned image.
%
cd /wusr5/brian/book/03col/fig/subRecSpecSens
load baylor

waveL = 385:5:830;
waveM = 385:5:800;
waveS = 385:5:600;

cS = polyfit(blue(:,1),blue(:,2),5)
cM = polyfit(green(:,1),green(:,2),5)
cL = polyfit(red(:,1),red(:,2),5)
fitS = polyval(cS,waveS);
fitM = polyval(cM,waveM);
fitL = polyval(cL,waveL);
%
%	Don't worry about error messages ...
%
plot(waveL,fitL,'r-',waveM,fitM,'g-',waveS,fitS,'b-', ...
     blue(:,1),blue(:,2),'bo', ...
     green(:,1),green(:,2),'go', ...
     red(:,1),red(:,2),'ro')
set(gca,'xlim',[350 850],'ylim',[-6 0.5], ...
         'xtick',[400:100:700]);
grid on
print -dpsc -Pdeskjet

set(gca,'xlim',[350 850],'ylim',[-6 0.5], ...
         'xtick',[400:100:700],'xticklabels',[],'yticklabels',[])
grid on
print -deps rec.spec.sens.eps



%
%	Making the Baylor matlab data file from the scanned data.
%

cd /wusr5/brian/book/03col/fig/subRecSpecSens

load -ascii baylorConesData.dat
range = 1:11;
blueS = baylorConesData(1:11,2);
blueWN =baylorConesData(1:11,1);
blueWL = (1 ./ blueWN)*1000;
plot(blueWL,blueS)

range = 12:33;
greenS = baylorConesData(range,2);
greenWN =baylorConesData(range,1);
greenWL = (1 ./greenWN)*1000

plot(greenWL, greenS)

range = 34:56;
redS = baylorConesData(range,2);
redWN =baylorConesData(range,1);
redWL = (1 ./redWN)*1000

plot(redWL, redS)

plot(blueWL,blueS,'bo',greenWL,greenS,'go',redWL,redS,'ro')

blue = [blueWL, blueS];
green = [greenWL, greenS];
red = [redWL, redS];

save baylor red green blue



plot(waveL,fitL,'r-',waveM,fitM,'g-',waveS,fitS,'b-', ...
     blue(:,1),blue(:,2),'bo', ...
     green(:,1),green(:,2),'go', ...
     red(:,1),red(:,2),'r*')
