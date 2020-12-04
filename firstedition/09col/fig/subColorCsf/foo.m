%
%
cd /home/brian/smartColor/slides/appearance/subSpaceCsf

load spaceCsf
load ncones
wave = 370:730;

spatialSpectral = ncones*cMech;
spatialSpectral = spatialSpectral(:,2:3);

%  These are the w-b, r-g and b-y mechanisms from
%  Eric Shen's fits using an offset plane.
%  The are in ( L M S)' weights on the ncones.
%
eric = [ ...
 8.2863  5.5964 -0.1292
 -6.1604 7.8143 -0.9928 
 -7.8069 3.9572 4.8366]'/10;

ericSpectral = ncones*eric;
ericSpectral = ericSpectral(:,2:3);

subplot(2,2,1)
plot(wave,ericSpectral,'--',wave,spatialSpectral,'-')
grid on

%
%	We have red-green and b-y for rezal
rezal = [ ...
 -6.0429 7.8664 -1.266
 -1.5496 -4.7944 8.6379 ]'/10;

subplot(2,2,2)
rezalSpectral = ncones*rezal;
plot(wave, rezalSpectral,'--',wave,spatialSpectral,'-');
grid on

katy =  [ ...
  8.1042 5.8261 0.616
  -6.3251 7.6921 -0.9078
  -3.971  -3.5954 8.4442]'/10;

subplot(2,2,3)
katySpectral = ncones*katy;
katySpectral = katySpectral(:,2:3);
plot(wave, katySpectral,'--',wave,spatialSpectral,'-');
grid on

amandaSpectral = ncones*amanda;
amandaSpectral = amandaSpectral(:,2:3);
plot(wave, amandaSpectral,'--',wave,spatialSpectral,'-');
plot(wave, amandaSpectral)
grid on

 
y     yellow  
m     magenta 
c     cyan    

r     red     
g     green   

b     blue    
w     white   

k     black   

alvin = [ ...
	.697 .331 -.194
	-2 1.895 -.043
	.773 -1.271 1.037]';
d = 1 ./ sqrt(diag(alvin'*alvin))
alvin = alvin*diag( d )
alvinSpectral = ncones*alvin;
alvinSpectral = alvinSpectral(:,2:3);
clf
plot(wave, alvinSpectral)
grid on

heinz = [ ...
	.783 .240 .067
	-2.235 2.588 -.363
	.038 -.415 1.019]';
d = 1 ./ sqrt(diag(heinz'*heinz))
heinz = heinz*diag( d )
heinzSpectral = ncones*heinz;
heinzSpectral = heinzSpectral(:,2:3);
plot(wave, heinzSpectral);
grid on

jeanSpectral = ncones*jean;
jeanSpectral = jeanSpectral(:,2:3);
plot(wave, jeanSpectral,'--',wave,spatialSpectral,'-');
grid on

subplot(2,2,4)
plot(wave,spatialSpectral,'-');
grid on

subplot(1,2,1)
rg = -[rezalSpectral(:,1) katySpectral(:,1) ...
      ericSpectral(:,1) amandaSpectral(:,1) jeanSpectral(:,1) ...
      alvinSpectral(:,1) heinzSpectral(:,1)];
p =  plot(wave,rg(:,1:3),'-',wave,rg(:,4:7),'--');
plotParms(p)
set(gca,'xlim',[350 750])
grid on

subplot(1,2,2)
by = -[rezalSpectral(:,2) katySpectral(:,2) ...
      ericSpectral(:,2) amandaSpectral(:,2) jeanSpectral(:,2) ...
      alvinSpectral(:,2) heinzSpectral(:,2)];
set(gca,'colororder',c)
p =  plot(wave,by(:,1:3),'-',wave,by(:,4:7),'--');
plotParms(p)
set(gca,'xlim',[350 750])
grid on

