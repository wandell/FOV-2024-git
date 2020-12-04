%
%	Localization images for Pattern Sensitivity
%
cd /wusr5/brian/book/06space/fig/subLocalization

x = -5:.05:5;
ls = lineSpread(x);	%I think the argument is in seconds, so this is
			%5 minutes worth of linespread
plot(x,ls)

%
%	The labels like 02,04, etc. refer to shifts of the
%	array.  Since the samples are spaced .05 minutes apart (3 sec).
%	we multiply each sample by 3 to obtain the separation in seconds,
%		6,12,24,48 seconds
%
shiftedL02 = [ls(2:length(ls)) zeros(1,length(ls)- length(2:length(ls)))];
shiftedR02 = [zeros(1,2)  ls(1:length(ls)-2) ];

shiftedL04 = [ls(4:length(ls)) zeros(1,length(ls)- length(4:length(ls)))];
shiftedR04 = [zeros(1,4)  ls(1:length(ls)-4) ];

shiftedL08 = [ls(8:length(ls)) zeros(1,length(ls)- length(8:length(ls)))];
shiftedR08 = [zeros(1,8)  ls(1:length(ls)-8) ];

shiftedL16 = [ls(16:length(ls)) zeros(1,length(ls)- length(16:length(ls)))];
shiftedR16 = [zeros(1,16)  ls(1:length(ls)-16) ];

height = 40;
shiftSeries = [64*(ls(ones(height,1),:)+1);
               64*(shiftedR04(ones(height,1),:)+1);
               64*(shiftedR08(ones(height,1),:)+1);
               64*(shiftedR16(ones(height,1),:)+1)];

spreadSeries = [64*(ls(ones(height,1),:)+1);
 64*(0.5*(shiftedR02(ones(height,1),:) + shiftedL02(ones(height,1),:)) + 1);
 64*(0.5*(shiftedR04(ones(height,1),:) + shiftedL04(ones(height,1),:)) + 1);
 64*(0.5*(shiftedR08(ones(height,1),:) + shiftedL08(ones(height,1),:)) + 1)
 ];

imageSeries = fliplr([shiftSeries spreadSeries]);

% Make the set of shifted linespread images
%
mp = gray(128);
tiffwrite(imageSeries,mp,' imageSeries.tif')

%tiffwrite(shiftSeries,mp,'shiftSeries.tif')
%tiffwrite(spreadSeries,mp,'spreadSeries.tif')


% These are just little graphs you might want to add
%
xrange = [min(x),max(x)]
subplot(1,2,1)
plot(x,ls,'-', ...
     x,0.5*(shiftedR04+shiftedL04),'-', ...
     x,0.5*(shiftedR08+shiftedL08),'-');
set(gca,'ylim',[0 1],'xlim',xrange);
axis off

subplot(1,1,1)
plot(x,shiftSeries,'-')
print -deps shiftGraph.eps
subplot(1,1,1)
plot(x,spreadSeries,'-')
print -deps spreadGraph.eps


