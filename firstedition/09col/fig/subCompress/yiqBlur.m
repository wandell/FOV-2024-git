%
% Start with an original color image (R,G,B).  Convert the image to
% Lum, R/G and B/Y. (i.e to YIQ space) Then, 
%
%1.  Remove high frequency Lum and reconstruct,
%2.  Remove high frequency R/G and reconstruct,
%3.  Remove high frequency B/Y and reconstruct.
%
% NOTE: color maps and trasformations are loaded from existing files.
%
% AUTHOR:  Wandell and Gigi Hel-Or
%
cd /home/brian/book/09col/fig/subCompress

cd fish
[pic mp] = tiffread('fish.tif');
[m,n] = size(pic);

%  Convert the map to YIQ space
load hit489
load hit489Gam
load YIQ
RGB2YIQ = YIQ'*hit489;
YIQ2RGB = inv(RGB2YIQ);

linmap = map2map(mp,hit489Gam);
yiqmp = ( RGB2YIQ * linmap' )';

[y i q] = ind2rgb(pic,yiqmp);

% create lowpass filter
%A = 0.136;
%B = 0.0453;
%C = 0.02265;
%gf = [C B B C ; B A A B ; B A A B ; C B B C ];

gf = mkGaussKernel(10,5);

yblur = convolvecirc(y,gf);
iblur = convolvecirc(i,gf);
qblur = convolvecirc(q,gf);

picrBlury = YIQ2RGB(1,1)*yblur + YIQ2RGB(1,2)*i + YIQ2RGB(1,3)*q;
picgBlury = YIQ2RGB(2,1)*yblur + YIQ2RGB(2,2)*i + YIQ2RGB(2,3)*q;
picbBlury = YIQ2RGB(3,1)*yblur + YIQ2RGB(3,2)*i + YIQ2RGB(3,3)*q;

picrBluri = YIQ2RGB(1,1)*y + YIQ2RGB(1,2)*iblur + YIQ2RGB(1,3)*q;
picgBluri = YIQ2RGB(2,1)*y + YIQ2RGB(2,2)*iblur + YIQ2RGB(2,3)*q;
picbBluri = YIQ2RGB(3,1)*y + YIQ2RGB(3,2)*iblur + YIQ2RGB(3,3)*q;

picrBlurq = YIQ2RGB(1,1)*y + YIQ2RGB(1,2)*i + YIQ2RGB(1,3)*qblur;
picgBlurq = YIQ2RGB(2,1)*y + YIQ2RGB(2,2)*i + YIQ2RGB(2,3)*qblur;
picbBlurq = YIQ2RGB(3,1)*y + YIQ2RGB(3,2)*i + YIQ2RGB(3,3)*qblur;

picrBlury = truncToRange(picrBlury,0,1);
picgBlury = truncToRange(picgBlury,0,1);
picbBlury = truncToRange(picbBlury,0,1);

[picBlury blurmap] = rgb2ind(picrBlury, picgBlury, picbBlury);
outmap = map2map(blurmap,invHit489Gam)/(size(blurmap,1)-1);
tiffwrite(picBlury,outmap,'Blury.tif')

picrBluri = truncToRange(picrBluri,0,1);
picgBluri = truncToRange(picgBluri,0,1);
picbBluri = truncToRange(picbBluri,0,1);
[picBluri blurmap] = rgb2ind(picrBluri, picgBluri, picbBluri);
outmap = map2map(blurmap,invHit489Gam)/(size(blurmap,1)-1);
tiffwrite(picBluri,outmap,'Bluri.tif')

picrBlurq = truncToRange(picrBlurq,0,1);
picgBlurq = truncToRange(picgBlurq,0,1);
picbBlurq = truncToRange(picbBlurq,0,1);
[picBlurq blurmap] = rgb2ind(picrBlurq, picgBlurq, picbBlurq);
outmap = map2map(blurmap,invHit489Gam)/(size(blurmap,1)-1);
tiffwrite(picBlurq,outmap,'Blurq.tif')



