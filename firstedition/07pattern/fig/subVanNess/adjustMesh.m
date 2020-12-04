function adjustMesh
%
%
%
[x y button] = ginput(1);

[az el] = view;

if button == 1
   view([az - 10, el]);
elseif button == 3
   view([az + 10, el]);
end
