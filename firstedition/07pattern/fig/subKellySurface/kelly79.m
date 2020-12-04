%
%	Kelly has a 1979 paper in JOSA, v. 69, no. 10, p. 1340
%	Motion and vision.  II. Stabilized spatio-temporal 
%	threshold surface
%
%	In which he defines the following equation for a
%	space-time sensitivity.
%
%	He uses omega for temporal freq  (cyc/sec)
%	        alpha for spatial freq   (cyc/deg)
%		nu    for velocity, i.e. 
%		  omega/alpha =  (cyc/sec / cyc/deg ) = deg/sec
%
%	Eqn. 8 defines the complete surface fit, but in general
%	terms it is
%
cd /home/brian/fov/07pattern/fig/subKellySurface

ft = 10 .^ [-.5:.05:1.7]
fs = 10 .^ [-.5:.05:1.3]

[ft fs] = meshgrid(ft,fs);
alpha = 2*pi*fs;	%used in the formula, related to spatial frequency

v = ft ./ fs;	%nu
k = 6.1 + 7.3*(abs(log10( v / 3 ))) .^ 3;
amax = 45.9 ./ (v + 2);
G = k .* v .* (alpha .* alpha) .* exp(-2*alpha ./ amax);

%	Pull out the ones above 1;
l = G < 1;
G(l) = ones(size(G(l)))*(0/0);  %	This sets the bad ones to NaN

% Student in Australia pointed out that to make this workf
% for standing, rather than traveling, waves we need to plot
% G/2 (see Kelly, 1979, p. 1341 and related discussion
%

G = G/2;

%view(233,40)
%view(143,40)
%view(-43,40)
%view(-123,40)

surf(ft,fs, G)
set(gca,'FontName','Bookman')
set(gca,'FontSize',16)

view(53,40)
set(gca,'zscale','log','xscale','log','yscale','log');
set(gca,'zlim',[0.5 300], 'xlim',[mmin(ft) 1.2*mmax(ft)], ...
        'ylim',[mmin(fs),1.2*mmax(fs)]);
set(gca,'xtick',[1 2 4 8 16 32],'ytick',[1 2 4 8 16 32],'ztick',[1 10 100])
grid on
colormap(0.5 + gray(100)*0.5)
%
%	TO print out for book
%

mp = [0.5*gray(64) + .5];
colormap(mp)
print -deps kellySurface.eps
print -dill kellySurface.ill

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%	Rerun to print to deskjet, then do this
%
colormap('cool')
xlabel('Temporal frequency (hz)')
ylabel('Spatial frequency (cpd)')
zlabel('Contrast sensitivity')
%print -dpsc -Pdeskjet

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	This makes figure 9 in Kelly 1979
%
fs = [.1 .2 .4 .8 1.6 3.2 6.4 12.8 25];
alpha = 2*pi*fs;

v = 3;
k = 6.1 + 7.3*abs(log10(v/3).^3)
amax = 45.9 ./ (v+2);
G1 = k * v * (alpha .^ 2) .* exp( -2 * (alpha / amax ));
plot(fs,G1)
set(gca,'xscale','log','yscale','log','xlim',[.15 8],'ylim',[1 1000]);

v = 32;
k = 6.1 + 7.3*abs(log10(v/3).^3)
amax = 45.9 ./ (v+2);
G2 = k * v * (alpha .^ 2) .* exp( -2 * (alpha / amax ));
plot(fs,[G1;G2])
set(gca,'xscale','log','yscale','log','xlim',[.15 8],'ylim',[1 1000]);

