%
% From p. 263 in Jenkins and White
% and in particular check out figure 13H
% I am not sure why the real fringes fall off, but this may
% have to do with the aperture widths or other real factors
%
%
lambda = 0.500; %mu
s2 =     10.0;  %mu
s1 =     -s2;
dx = (s2 - s1)/500;
x = 2*S2:dx:2*S1;	%mu
delta = (2*pi / lambda) * (S2 - S1)*x;

I =  cos(delta/2).^2;

plot(x,I)

