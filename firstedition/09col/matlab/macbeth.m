%
%	Put up an approximation to the macbeth chart
%
cd /wusr5/brian/book/09col/fig/subMacbethRender

load macbethChart; load D65; load cieabc; load XYZ
load hit489; load hit489Gam
wave = 370:730;

%
%	Pick a light
%
%lgt = cieabc(:,2)
lgt = D65;

%
macbethImage = reshape(1:24,6,4)
macbethImage = fliplr(macbethImage);
%
% XYZ = XYZ'*hit489*linearRGB
%
macbethXYZ = XYZ'* diag(lgt)* macbethChart;
%
% white is 19
%
%	Display the Macbeth Chart
%
subplot(1,2,1)
macbethLinearRGB = inv(XYZ'*hit489)*macbethXYZ;
macbethLinearRGB = round(1000*macbethLinearRGB/(mmax(macbethLinearRGB)));
macbethLinearRGB = max(1, macbethLinearRGB);
macbethRGB =  invHit489Gam(macbethLinearRGB);
%
macbethColorMap = macbethRGB/255;
image(macbethImage); axis image
colormap(macbethColorMap')

%
%	Correct the white to white
%
subplot(1,2,2)
macbethImage = reshape(25:48,6,4)
macbethImage = fliplr(macbethImage);
%
wht = macbethLinearRGB(:,19);
macbethLinearRGB = diag( (1 ./ wht )  ) * macbethLinearRGB;
%
macbethLinearRGB = round(1000*macbethLinearRGB/(mmax(macbethLinearRGB)));
macbethLinearRGB = max(1, macbethLinearRGB);
macbethRGB =  invHit489Gam(macbethLinearRGB);
macbethColorMap = [macbethColorMap macbethRGB/255];
image(macbethImage); axis image
colormap(macbethColorMap')
macbethImage


mp = (macbethRGB/255)'
X = fliplr(rot90(macbethImage)) - 24
image(X)
axis off, axis image
colormap(mp)
tiffwrite(X,mp,'macbethImage.tif')

%
%	Linear Model Approximation to the Macbeth Color Checker
%
[U S V] = svd(macbethChart,0);
for i=1:4
 subplot(2,2,i)
 plot(wave,U(:,i))
end

lsm = U;
wgts = S* V';

%
%	1d approximation
%
cMap = [];
dim = [1 2 3 4 5 24];
macbethImage = reshape(1:24,6,4)
for i=1:6
 subplot(2,3,i)
 d=1:dim(i)
 Approx = lsm(:,d)*wgts(d,:);
 ApproxXYZ = XYZ'*diag(lgt)*Approx;
 macbethLinearRGB = inv(XYZ'*hit489)*ApproxXYZ;
 wht = macbethLinearRGB(:,19);
 macbethLinearRGB = diag( (1 ./ wht )  ) * macbethLinearRGB;
%
 macbethLinearRGB = round(1000*macbethLinearRGB/(mmax(macbethLinearRGB)));
 macbethLinearRGB = max(1, macbethLinearRGB);
 macbethRGB =  invHit489Gam(macbethLinearRGB);
%
 cMap = [cMap,macbethRGB/255];
 if size(cMap,2) > 6*24
  sprintf('dimension of color map too large')
 end
 image(macbethImage + 24*(i-1)); axis image; axis off
 colormap(cMap')
 name = sprintf('Approx.%d.tif',dim(i));
 tiffwrite(macbethImage + 24*(i-1),cMap',name);
 t = sprintf('Dim = %d',dim(i))
 title(t)
end

print -dpsc macbethRender.ps

%
%	Show the linear model approximations
%
clf
d=1:3
p = 1;
for i=1:4:24
 Approx = lsm(:,d)*wgts(d,:);
 subplot(3,6,p)
 p = p + 1;
 plot(wave,Approx(:,i),'-',wave,macbethChart(:,i),'--')
 set(gca,'xlim',[400 700],'xtick',[450 650],'ylim',[0 1],'ytick',[])
end

d=1:2
p= 7;
for i=1:4:24
 Approx = lsm(:,d)*wgts(d,:);
 subplot(3,6,p)
 p = p + 1;
 plot(wave,Approx(:,i),'-',wave,macbethChart(:,i),'--')
 set(gca,'xlim',[400 700],'xtick',[450 650],'ylim',[0 1],'ytick',[])
end

d=1
p= 13;
for i=1:4:24
 Approx = lsm(:,d)*wgts(d,:);
 subplot(3,6,p)
 p = p + 1;
 plot(wave,Approx(:,i),'-',wave,macbethChart(:,i),'--')
 set(gca,'xlim',[400 700],'xtick',[450 650],'ylim',[0 1],'ytick',[])
end

print -deps macbethApprox.eps

%
%	Plot the Basis Functions
%
for i=1:4
  subplot(2,2,i)
  plot(wave,lsm(:,i),'-')
  set(gca,'xlim',[400 700],'xtick',[400 500 600 700],'ylim',[-0.1 0.1], ...
          'xgrid','on','ygrid','on')
end
print -deps macbethBasis.ps

