%
%	Camera relationship and Gamma explanation
%
cd /wusr5/brian/book/Edits/03col/fig/subDisplayCamera
load pulnixGam		%loads pulnixGam invPulnixGam

subplot(1,2,1)
s = [0:999]/1000;
plot(s,invPulnixGam)
set(gca,'xgrid','off','ygrid','off','xtick',[0:0.25:1])

subplot(1,2,2)
plot(s,invHit489Gam(:,1))
set(gca,'xgrid','off','ygrid','off','xtick',[0:0.25:1])

print -deps displayCamera

%%%%%%%%%%%%%%%%%%%%%Stuff%%%%%%%%%%%%%%%%%


% Label them
subplot(1,2,1)
title('Pulnix Camera')
xlabel('Input Light Intensity')
ylabel('Frame-Buffer Value')
subplot(1,2,2)
title('Hitachi Monitor (red phoshor)')
xlabel('Relative Light Intensity')
ylabel('Frame-Buffer Value')
print

%
%	XYZ lightness calculations.
%	


load xyz
vlambda = XYZ(:,2);

displayLuminance = vlambda'*hit489;
phosphorLuminance = hit489Gam*diag(intensity)*diag(displayLuminance);

plot(dac, phosphorLuminance(:,1),'r-',...
     dac, phosphorLuminance(:,2),'g--',...
     dac, phosphorLuminance(:,3),'b-.');

whitePntxy = XYZ2xy(XYZ'*hit489*ones(3,1));	% Near 9000, looks blue.

