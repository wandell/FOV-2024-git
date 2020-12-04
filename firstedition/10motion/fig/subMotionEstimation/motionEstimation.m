cd /home/brian/book/09motion/fig
[x y] = meshgrid(-1:.1:1,-1:.1:1);
z = x + y;
z = sqrt(1 - x.^2 - y.^2);
colormap(ones(10,3));
mesh(real(z))
print -deps sphere
