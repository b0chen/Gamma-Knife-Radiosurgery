% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Radial_Dose_Test tests Compute_Radial_Dose

Helmet = [10, 15];
maxRadialDistance = 3*max(Helmet)/2+.5;
beamRadius = max(Helmet);
radialDistanceResolution = 1;

global radialDoseLUT;
radialDoseLUT = Compute_Radial_Dose(maxRadialDistance, beamRadius, radialDistanceResolution);
disp(radialDoseLUT);
