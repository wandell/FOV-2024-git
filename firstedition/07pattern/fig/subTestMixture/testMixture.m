%
%	Make the testMixtureData figure from Norma's graphs
%	in her book, Fig. on page 163.
%
cd /home/brian/book/06space/fig/subTestMixture

load grahamFigP163
meanSimple = (openCircles + openSquares + openTriangles) / 3;
%
%	I make the prediction up here
%
predCompound = meanSimple* diag([1/sqrt(3),1])

%
%	Open are the simple, filled the compound
%
p = plot(openCircles(:,1),openCircles(:,2),'w+', ...
     openCircles(:,1),openCircles(:,2),'w--', ...
     openSquares(:,1),openSquares(:,2),'wo', ...
     openSquares(:,1),openSquares(:,2),'w--', ...
     openTriangles(:,1),openTriangles(:,2),'wx', ...
     openTriangles(:,1),openTriangles(:,2),'w--', ...
     filledSquares(:,1),filledSquares(:,2),'w*', ...
     filledSquares(:,1),filledSquares(:,2),'w-', ...
     filledCircles(:,1),filledCircles(:,2),'wx', ...
     filledCircles(:,1),filledCircles(:,2),'w-', ...
     predCompound(:,1), predCompound(:,2),'r-.');

%     meanSimple(:,1),meanSimple(:,2),'r-', ...

grid on

set(gca,'xlim',[.25 2],'ylim',[50 102],...
        'xtick',[0.5:.5:2],'ytick',[50:10:100])

plotParms(p);
print -deps mixture3.eps



