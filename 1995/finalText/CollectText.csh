#!/bin/csh -f
#
#	Collect up the final form of the text for sending to Peter
#

echo "Collecting up the chapters and parts"

cd /home/brian/book

set dir = finalText
cat preamble.tex math.tex > $dir/header.tex
cat Preface/preface.tex  > $dir/chap01.tex
cat Part1/overview.tex > $dir/part1.tex
cat 01imgfor/cvis.?.tex > $dir/chap02.tex
cat 02mosaic/cvis.?.tex > $dir/chap03.tex
cat 03col/cvis.?.tex > $dir/chap04.tex
cat Part2/overview.tex > $dir/part2.tex
cat 04retina/cvis.?.tex > $dir/chap05.tex
cat 05cortex/cvis.?.tex > $dir/chap06.tex
cat 06space/cvis.?.tex > $dir/chap07.tex
cat 07imgrep/cvis.?.tex > $dir/chap08.tex
cat Part3/overview.tex > $dir/part3.tex
cat 08col/cvis.?.tex > $dir/chap09.tex
cat 09motion/cvis.?.tex > $dir/chap10.tex
cat 10ill/cvis.?.tex > $dir/chap11.tex
cat Part4/overview.tex > $dir/part4.tex
cat 11app/cvis.?.tex > $dir/appendix.tex

cd /home/brian/book/finalText

echo "Making the tar file"

set head = header.tex
set pref = chap01.tex
set part1 = "part1.tex chap02.tex chap03.tex chap04.tex"
set part2 = "part2.tex chap05.tex chap06.tex chap07.tex chap08.tex"
set part3 = "part3.tex chap09.tex chap10.tex chap11.tex"
set part4 = "part4.tex appendix.tex"
tar cvf -  $head $pref $part1 $part2 $part3 $part4 | compress > bookText.tar.Z
