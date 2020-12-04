
%	Rod cone distribution
cd /wusr5/brian/book/02mosaic/fig/subRodConeDist

load rod
load cone
plot(rod(:,1),rod(:,2),'b-',cone(:,1),cone(:,2),'g-')
set(gca,'xlim',[-70 80],'ylim',[0 180000])
xlabel('Degrees of Visual Angle')
ylabel('Receptors per square mm')
print -dpsc -Pdeskjet

plot(rod(:,1),rod(:,2),'w-',cone(:,1),cone(:,2),'w:')
set(gca,'xlim',[-70 80],'ylim',[0 180000])
set(gca,'xticklabels',[],'yticklabels',[])
print -deps rodConeDist.eps
