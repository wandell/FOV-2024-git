%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Illustrate how we get hyperacuity resolution:  vernierSample.
%
cd /wusr5/brian/book/06space/fig/subLocalization

% Make 5 minutes worth of linespread
%
x = -5:.05:5;
ls = lineSpread(x);
%plot(x,ls)

% Make sample points every 30 sec (1/2 minute) for cones
%
sampleValues = 5:10:length(ls);
nSamples = length(sampleValues);
positions = 0.05*sampleValues - 5;

% Make a sampled version of the linespread
%
block = ones(1,10)/10;
f = conv2(block,ls);
f = vecRotate(f,1);
sampledls = f(sampleValues);
plot(sampledls)

% And now a shifted, sampled version
%
shiftedls = vecRotate(ls,4,'r');
f = vecRotate(conv2(block,shiftedls),1);
sampledlsShift =  f(sampleValues);
plot(sampledlsShift)

p = plot(positions, sampledls,'w-',...
     positions, sampledls, 'wx', ...
     positions, sampledlsShift, 'w--',...
     positions, sampledlsShift, 'wo')
plotParms(p);
set(gca,'xtick',[-6:0.5:6],'xticklabels',[],'yticklabels',[])
grid on
print -deps vernierSample.eps

%  Now make the inset graph of the ratios
%
r = sampledls ./ sampledlsShift;
p = plot(positions(2:nSamples),r(2:nSamples),'o', ...
     positions(2:nSamples),r(2:nSamples),'-')
set(gca,'xtick',[-6:.5:6],'ytick',[0.5:.5:1.5], ...
        'xticklabels',[],'yticklabels',[], ...
        'ylim',[.5 1.5]);
grid on
plotParms(p);
print -deps ratio.eps



