%
%	Linear space-time receptive field
%
cd /home/brian/book/05retina/fig/subStReceptiveField

x = [1:128];
x = x - length(x)/2;
center = mkGaussKernel(size(x),[1 4]);
surround = mkGaussKernel(size(x), [1 24]);
dog = center - .5*surround;
dog = dog / mmax(dog);

%
%	Now make the model receptive field output for linear analysis
%
t = [0:80];	%Imagine 80 msecs in 1 msec ticks
timecourse = exp(-t/15);
centerTimecourse = [zeros(1,10) timecourse(1:length(t) - 10)];
surroundTimecourse = [ zeros(1,30) timecourse(1:length(t)-30)  ];
blur = mkGaussKernel([1 16], [1 6]);
surroundTimecourse = conv2(surroundTimecourse,blur,'same');
centerTimecourse = conv2(centerTimecourse,blur,'same');

%
%	The space-time receptive field is separable within each
%  mechanism, so the overall receptive field is
receptiveField = center'*centerTimecourse - surround'*surroundTimecourse;

%
%	Make plot of individual center and surround responses
%
c = 64;
s = 80;
p = plot(t,receptiveField(c,:),'-',t,receptiveField(s,:),'-');
set(p,'linewidth',2)
set(gca,'fontname','Bookman','fontsize',16)
set(gca,'xtick',[0:20:60],'ytick',[-.1:.05:0.1], ...
	'xlim',[0 80],'ylim',[-0.05 .1]);
grid on
print -deps timecourse.eps
print -dill timecourse.ill

r1 = [45:2:80]; r2 = [1:2:60];
surf(r2,r1 - ((max(r1) + min(r1))/2),receptiveField(r1,r2))
colormap(.4*gray(64) + .6)
set(gca,'fontname','Bookman','fontsize',16)
set(gca,'xlim',[0 80],'xtick',[0:20:80]);
set(gca,'ylim',[-20 20],'ytick',[-20:10:20]);
set(gca,'zlim',[-0.05 .1],'ztick',[-0.05:.05:.1]);
axis ij
az =  -47.5;  el =  30;
view([az el])
grid on
print -deps receptiveField.eps
print -dill receptiveField.ill


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Not used%%%%%%%%%%%%%%%%%%%%
%
%	Make an image with noise added to the receptiveField
%
randn('seed',0);
noise = 0.05*mmax(dog)*randn( [ length(dog),length(t) ]);
response = receptiveField + noise;

colormap(gray(64))
brighten(.7)

imagesc(receptiveField)
imagesc(response)
contour(response)

