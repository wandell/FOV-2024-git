
% Create an S cone density plot to go along with the lm cone
% stuff that is in cone.mat and rod stuff in rod.mat

load -ascii sConeDensity.dat
sDensity = sConeDensity;

% Convert to deg of visual angle, and place it on the left side
% of the graph, away from the blindspot

sDensity(:,1) = -1*sDensity(:,1)/0.3;

% Load in the total cone data, and extend the S cone values for
% the longer range so that it makes up 7 percent of the population

load cone
lmDensity = cone;
l = find(lmDensity(:,1) < min(sDensity(:,1) ));
sNew = zeros(size(lmDensity(l,:)));
sNew(:,1) = lmDensity(l,1);
sNew(:,2) = lmDensity(l,2)*0.07;
sDensity = [sDensity; flipud(sNew)];

comment = 'S cone density [deg,cones/mm^2], Curcio et al. 1991,makeSDensity.m';
save sDensity sDensity comment

%
% To check

load sDensity; comment
semilogy(...
    lmDensity(:,1), lmDensity(:,2),'yo', ...
    sDensity(:,1), sDensity(:,2),'co', ...
    lmDensity(:,1), lmDensity(:,2),'y-', ...
    sDensity(:,1), sDensity(:,2),'c-' )
%

