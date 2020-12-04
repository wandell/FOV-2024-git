%
%
cd /wusr5/brian/book/06space/fig/subRobson

load -ascii robson1.dat
load -ascii robson2.dat
load -ascii robson3.dat
load -ascii robson4.dat

sf22 = robson1(:,1);
sf16 = robson2(:,1);
sf6 = robson3(:,1);
sf1 = robson4(:,1);

sens22 = robson1(:,2);
sens16 = robson2(:,2);
sens6 = robson3(:,2);
sens1 = robson4(:,2);

%
%	Check the data ... there was a problem with the
%	initial DataTheif parsing
%
plot(sf1,sens1,'w-',sf1,sens1,'wo')
plot(sf6,sens6,'w-',sf6,sens6,'wo')
plot(sf16,sens16,'w-',sf16,sens16,'wo')
plot(sf22,sens22,'w-',sf22,sens22,'wo')

save robsonData sf1 sens1 sf6 sens6 sf16 sens16 sf22 sens22

