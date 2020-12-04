%
%	Westheimer's linespread formula
cd /home/brian/book/01imgfor/fig/subWestheimer
%

%	x is in minutes of visual angle
x = -61:0.1:60;	%minutes of arc

ls = 0.47*exp(-3.3 *(x.^2)) + 0.53*exp(-0.93*abs(x));

plot(x,ls); grid on; 
xtick = [-6:2:6];
ytick = [0:.2:1];
set(gca,'xlim',[min(xtick) max(xtick)], ...
        'xtick', xtick, 'xticklabels',[],...
	'ytick', ytick, 'yticklabels',[]);
print -deps westheimerLS.eps

mtf = abs(fft(ls));
mtf = mtf/max(mtf);

min2deg = 1/60;

%	So, now the freq is cycles per length
maxCyclesPerInterval = length(x)*0.5;	%Freq per total length
degPerInterval = (max(x) - min(x))/60;	%Interval in degress
intervalPerDeg = 1/degPerInterval;
%
% Now, normalize the cycles per Interval to cycles per degree by
% multiplying by (c / int) * (int / deg ) = c / deg
%
freq = [1: maxCyclesPerInterval] / IntervalPerDeg;
plot(freq,mtf(1:length(freq)))
grid on;

set(gca,'ylim',[0 1],'yticklabels',[],'xticklabels',[])
print -deps westheimerMTF.eps

ps = 0.952*exp(-2.59*abs(x).^1.36) + 0.048*exp(-2.43*abs(x).^1.74);
plot(x,ps); grid on; 
ytick = [0:.2:1];
xtick = [-3:1:3];
set(gca,'xlim',[min(xtick) max(xtick)], 'yticklabels',[], 'xticklabels',[],...
        'xtick', xtick);
print -deps westheimerPS.eps
 
%
%	Plot the MTF from Westheimer, Williams and the interferometric data
mtf2 = williamsMtf;

load williams

plot([0:59],mtf2(1:60),'-.',freq,mtf(1:length(freq)),'-', ...
     dataF,drw,'x',dataF,dhb,'o',dataF,rnb,'+')
grid on

set(gca,'yticklabels',[], 'xticklabels',[]);
print -deps williams.eps



%	The Westheimer and the Williams MTFs largest differences
%	are about 20 percent or a tiny bit more.
plot(mtf2(1:60) ./ mtf(1:2:120))
