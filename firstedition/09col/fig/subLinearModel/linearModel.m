load daycie
wave = 370:730;
plot(wave,daycie)
grid on
set(gca,'fontsize',20)
set(gca,'xtick',[350:100:750]);
print -deps linearMod.eps
