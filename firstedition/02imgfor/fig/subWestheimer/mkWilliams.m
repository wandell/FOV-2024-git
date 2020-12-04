load -ascii dhbOtf.dat
load -ascii drwOtf.dat
load -ascii rnbOtf.dat
dataF = dhbOtf(:,1);

dhb = dhbOtf(:,2)
drw = drwOtf(:,2)
rnb = rnbOtf(:,2)

save williams dataF dhb drw rnb


