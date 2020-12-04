%
%	Figures for the Wassef data analysis
%
cd /wusr5/brian/book/08col/matlab/wassef
load xyz; load ncones; load cieabc
xyz2ncones = XYZ \ ncones

%
%	Load raw data and convert to Smith-Pokorny
%
load -ascii table1.dat
table1 = table1*xyz2ncones
illaT = table1(1:10,:)
illaM = table1(11:20,:)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	wassefVK
%
%	Affine fits, not precisely VK, through the data in
%	cone absorption space.
%
clf
wave = 370:730;
p = plot(wave,cieabc(:,1),'y-',wave,cieabc(:,3),'b-');
set(p(2),'color',[.5  .5 1])
set(gca,'xtick',[400:100:700],'ytick',[0:50:250])
grid on
print -depsc wassefIll.eps

(ncones'*cieabc(:,3)) ./ (ncones'*cieabc(:,1))

clf
o = ones(size(illaT,1),1);
r = [.4 .4; .4 .4 ; .4 .4];
for i=1:3
 disp('Enter  to continue')
 pause
 mx = 1.2*mmax([illaT(:,i) ; illaT(:,i)])
 x = 0:mx/50:r(i,1);
 s = [illaT(:,i),o]\illaM(:,i)	%This is an affine fit, not linear
%s = illaT(:,i)\illaM(:,i)      %Scalar, pure von Kries fit.
 plot(illaT(:,i),illaM(:,i),'+', ...
     x,s(1)*x+s(2),'-')
 grid on
 mx = 1.2*mmax([illaT(:,i) ; illaM(:,i)])
 set(gca,'xlim',[0.0 r(i,1)],'ylim',[0.0 r(i,2)], ...
         'xtick',[0 .1 .2 .3 .4],'ytick',[0 .1 .2 .3 .4],...
	 'fontsize',24);
 fname = sprintf('wassef.%d',i);
 eval(['print -deps ' fname]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%			wassefShift.id
%
%	These are the test (illuminant A) and match (illuminant C)
%	of Wassef's experimental data.  The XYZ data are converted
%	to LMS.  Since she used the OSA tables, I assume that the
%	XYZ values are properly scaled in this instance.
%
%	TWO-D versions of the graphs
%
p = plot(illaT(:,1), illaT(:,2),'o',...
     illaM(:,1),illaM(:,2),'*');
set(p(2),'color',[.5  .5 1])
set(gca,'xtick',[.2:.05:.4],'ytick',[.1:.1:.3])
grid on
set(gca,'fontname','Bookman','fontsize',16)
print -depsc wassefShiftLM

p = plot(illaT(:,2), illaT(:,3),'o',...
     illaM(:,2),illaM(:,3),'*');
set(p(2),'color',[.5  .5 1])
set(gca,'xtick',[.1:.05:.4],'ytick',[.1:.1:.3])
grid on
set(gca,'fontname','Bookman','fontsize',16)
print -depsc wassefShiftMS








%%%%%%%%%%%%%%%%%%%%%%%Miscellaneous, not used yet%%%%%%%%%%%%%%%%%%%%
%
%
%	A\B is the solution to Ax=B
%
x = yellowT\yellowM
predM = yellowT*x
plot(predM,yellowM,'+')
set(gca,'xlim',[0.10 0.50],'ylim',[0.10 0.50])
mn = mmin(predM); mx = mmax(predM);
line([mn mx], [mn mx]);

datT = illaT
datM = illaM
x = datT\datM
predM = datT*x
plot(predM,datM,'+')
set(gca,'xlim',[0.10 0.50],'ylim',[0.10 0.50])
mn = mmin(predM); mx = mmax(predM);
line([mn mx], [mn mx]);

x = yellowM\yellowT
predT = yellowM*x
plot(predT,yellowT,'+')
mn = mmin(predT); mx = mmax(predT);
line([mn mx], [mn mx]);

yellowTxy = XYZ2xy(yellowT');
yellowMxy = XYZ2xy(yellowM');
plot(yellowMxy(1,:),yellowMxy(2,:),'-', ...
     yellowTxy(1,:),yellowTxy(2,:),'-', ...
     yellowMxy(1,:),yellowMxy(2,:),'o', ...
     yellowTxy(1,:),yellowTxy(2,:),'+');

plot3(yellowT(1,:)',yellowT(2,:)',yellowT(3,:)','o')



%
%
%
illa = [ .926 .441 .141; -.619 2.341 -.303;-.553 .923 3.269]

illaT*x ./ (illa*illaT')'

%
%	I tried some 3d versions, but it never
%	looked good on the printed page.
%
subplot(1,1,1)
plot3(illaT(:,1),illaT(:,2),illaT(:,3),'+', ...
      illaM(:,1),illaM(:,2),illaM(:,3),'o')
grid on
xlabel('L');ylabel('M');%zlabel('S')
view(125, 10)
view(85, 10)
print -deps wassefShift1

plot3(illaT(:,1),illaT(:,2),illaT(:,3),'+', ...
      illaM(:,1),illaM(:,2),illaM(:,3),'o')
%grid on;xlabel('L');ylabel('M');zlabel('S')
view(125, 60)
print -deps wassefShift2

m = moviein(10);
for i=1:10
  view(i*20+5, 60)
  m(:,i) = getframe;
end
movie(m)   
m = capture;



load -ascii table2.dat
load -ascii table3.dat
load -ascii table4.dat
table2 = table2*trans;
table3 = table3*trans;
table4 = table4*trans;
magT = table2(1:10,:)
magM = table2(11:20,:)
yellowT = table3(1:10,:)
yellowM = table3(11:20,:)
greenT = table4(1:10,:)
greenM = table4(11:20,:)

illaTxy = XYZ2xy(illaT')'
illaMxy = XYZ2xy(illaM')'
illAxy = XYZ2xy(ncones'*cieabc(:,1))
illCxy = XYZ2xy(ncones'*cieabc(:,3))
plot(illaTxy(:,1),illaTxy(:,2),'+', ...
     illaMxy(:,1),illaMxy(:,2),'o', ...
     illAxy(1),illAxy(2),'+', ...
     illCxy(1),illCxy(2),'o');
     
