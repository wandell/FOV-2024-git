%
%	Make the Airy pattern using the formula in Goodman
%
x = -3:.101:3;
y = ( 2* bessel(1,abs(pi*x)) ./ abs(pi*x) ) .^ 2;
set(gca,'ylim',[0 1.1],'xTickLabels', [], 'yTickLabels',[])
grid on
plot(x,y)
print -deps airPattern.eps
