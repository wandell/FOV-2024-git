%
%	Figures for the Wassef data analysis
%
cd /home/brian/book/08col/fig/subWassef
load xyz; load ncones; load cieabc
xyz2ncones = XYZ \ ncones

illAcolor = [1 .5 0];
illCcolor = [0 0 1];

%
%	Plot the Wassef illuminants
%
wave = 370:730;
p = plot(wave,cieabc(:,1),'y-',wave,cieabc(:,2),'b-')
set(p,'linewidth',2)
set(p(2),'color',illCcolor)
set(p(1),'color',illAcolor)
set(gca,'xtick',[350:100:700],'ytick',[0:50:250],'xlim',[350 750])
grid on
set(gca,'fontname','Bookman','fontsize',20)
print -depsc wassefIll.eps

%
%	Load raw data and convert to Smith-Pokorny
%
load -ascii wassefData/table1.dat
table1 = table1*xyz2ncones
illaT = table1(1:10,:)
illaM = table1(11:20,:)

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
p = plot(illaT(:,1), illaT(:,2),'*',...
     illaM(:,1),illaM(:,2),'*');
set(p(1),'markersize',10,'color',illAcolor)
set(p(2),'markersize',10,'color',illCcolor)
set(gca,'xtick',[.2:.05:.4],'ytick',[.1:.1:.3])
grid on
set(gca,'fontname','Bookman','fontsize',16)
print -depsc wassefShiftLM

p = plot(illaT(:,2), illaT(:,3),'*',...
     illaM(:,2),illaM(:,3),'*');
set(p(1),'markersize',10,'color',illAcolor)
set(p(2),'markersize',10,'color',illCcolor)
set(gca,'xtick',[.15:.05:.4],'ytick',[.1:.1:.3])
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
     
