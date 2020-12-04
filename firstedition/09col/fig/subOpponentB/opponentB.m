%
%	Plot an estimated color ellipsoid from some study
%
cd /home/brian/book/09col/fig/subOpponentB
%
%	Use the old data to illustrate and ellipsoid
%	These are the data in 650nm and 540 nm coordinates
%
load ellJOSA
plot(ell(:,1),ell(:,2),'+')
%
%	Convert the physical representation to LMS cones
%	Take the ell intensities and multiply them by the
%	650 and 540 nm LMS cone values
%
wave = 370:730;
load ncones
w650 = find(wave == 650);
w540 = find(wave == 540);
m = [ncones(w650,:);ncones(w540,:)]';
lmsEllipse = m*ell';
lmEllipse = lmsEllipse([1 2],:)';
plot(lmEllipse(:,1),lmEllipse(:,2),'+')
grid on
%
%	Find a decent ellipse through the LM measurements
%
lmQuadForm = zeros(size(lmEllipse,1),3);
lmQuadForm(:,1) = lmEllipse(:,1).^2;
lmQuadForm(:,2) = lmEllipse(:,2).^2;
lmQuadForm(:,3) = 2*lmEllipse(:,1).*lmEllipse(:,2);

qWgts = lmQuadForm \ ones(size(lmEllipse,1),1);
qForm = [ ...
        qWgts(1) qWgts(3) ; ...
        qWgts(3) qWgts(2) ;];


%
%	Make a circle for trying all directions
%
nSample = 512;
[X Y Z] = cylinder(1,nSample);
X = X(1,1:nSample);
Y = Y(1,1:nSample);
circle = [X;Y];
plot(circle(1,:),circle(2,:),'+')
axis equal

%		The LM cross-section is easy
%
%	This is the relationship between the point on the circle
%	and the sensitivity
%
sens = 1 ./ sqrt(diag(circle'*qForm*circle));
cSens = circle*diag(sens);
plot(sens)

%
%	This is the resulting ellipse in the LM frame
%
p = plot(cSens(1,:),cSens(2,:),'-',lmEllipse(:,1),lmEllipse(:,2),'wo')
plotParms(p);
set(p(1),'linewidth',2,'linestyle','-')
set(p(2),'markersize',8)
set(gca,'fontsize',20)
set(gca,'gridlinestyle',':')
axis equal
grid on

lim = [-7 7];
tick =[-6:3:6];
set(gca,'xlim',lim,'ylim',lim,'xtick',tick,'ytick',tick);

print -deps colorEllipseJOSA.eps  %This is observer TG, panel (b) Fig. 8

%
%	Now, you could add the spatio-temporal image to show the stimulus
%
subplot(1,1,1)
im = mkGaussKernel([128 128],[24 24]);
im = scale(im,1,128);
image(im), colormap(gray(128));
mp = colormap;
axis image, axis off
tiffwrite(im,mp,'space.tif');

t = mkGaussKernel([1 128],[1 32]);
p = plot(t);
plotParms(p)
set(gca,'ytick',[],'xtick',[])
axis off
print -deps time.eps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%
%		An alternative set is to use the curves from Allen's
%	Task-dependent study.
%
%	This is the quadratic from Task-dependent with Allen in Table
%	2 of the appendix
%
%	This is the full quadratic, just in case you want other cross-sections
q = [ ...
   99.3200 -137.1700   24.9300; ...
 -137.1700  198.0600  -23.7100; ...
   24.9300  -23.7100   39.1400];


%
%	This is the part that has to do with the L and M cones
%
qLM = [ ...
   99.3200 -137.1700; ...
 -137.1700  198.0600];


%
%	Create sample points along the circle
%
nSample = 256;
[X Y Z] = cylinder(1,nSample);
X = X(1,1:nSample);
Y = Y(1,1:nSample);
circle = [X;Y];
plot(circle(1,:),circle(2,:),'+')
axis equal

%		The LM cross-section is easy
%
%	This is the relationship between the point on the circle
%	and the sensitivity
%
sens = 1 ./ sqrt(diag(circle'*qLM*circle));
cSens = circle*diag(sens);
plot(sens)

%
%	This is the resulting ellipse in the LM frame
%
plotParms(plot(cSens(1,:),cSens(2,:),'-'))
tick = [-.8:.2:.8];
lim = [-.6 .6];
set(gca,'xtick',tick,'ytick',tick, ...
         'xlim',lim,'ylim',lim)
axis equal
grid on
print -deps colorEllipse.eps	%This is observer TG, panel (b) Fig. 8


%		The B vs. L+M cross-section.
%
%	Convert the circle coordinates into B/L+M coordinates
%	The matrix by contains vectors in the blue-yellow direction only
%	The amount of blue and yellow is the same as the circle
%	coordinates.
byDirection = [1 1 0; 0 0 1]';
by = byDirection*circle;

%
%	Compute the sensitivity to these vectors using the general
%	quadratic
%
sens = 1 ./ sqrt(diag(by'*q*by));
plot(sens)
cSens = circle*diag(sens);
%
%	Notice that this is a sinusoid plus a shift, as expected?
%

%
%	Make the B vs. L+M cross-section plot
%
plotParms(plot(cSens(1,:),cSens(2,:),'-'))
axis equal
tick = [-.8:.2:.8];
lim = [-.4 .4];
set(gca,'xtick',tick,'ytick',tick, ...
         'xlim',lim,'ylim',lim)
axis equal
grid on
print -deps byColorEllipse.eps


