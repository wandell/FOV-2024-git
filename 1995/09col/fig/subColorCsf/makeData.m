%
%	W-B, Red-Green, B-Y in columns
%
%	N.B.:  The spatial frequency is a bit of a cheat
%	since .1 is really a patch
%
spFreq = [.2 1 2 4 8];
spSens = [ ...
    0.9160    0.8730    0.8720;
    1.0250    0.5600    0.6040;
    0.9870    0.5590    0.4850;
    0.9260    0.4640    0.3880;
    0.7030    0.2630    0.0960];

cMech = [ ...
         0.990 -0.106 -0.094;
        -0.669  0.742 -0.027;
	-0.212 -0.354 0.911]';
        
amanda = [ ...
	0.999 .009 0
	-.694 .719 .039
	.397 -.751 .528]';

jean = [ ...
	.962 .004 -.272
	-.658 .751 -.049
	.095 -.589 .802]';

save spaceCsf spFreq spSens cMech amanda jean

