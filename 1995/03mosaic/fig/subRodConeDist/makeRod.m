%
% The raw data were

load -ascii roddist.mat
rod = roddist;

%
find(rod(:,1) == -0.5168)
rod(37,1) = -1.50

comment = 'rod density, [deg,cones/mm^2], scanned from Boynton';
save rod rod comment
