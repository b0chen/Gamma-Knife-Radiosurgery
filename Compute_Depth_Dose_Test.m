% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Depth_Dose_Test tests Compute_Depth_Dose with the given and
% appropriate max_depth_from_skin, d0, depth_from_skin_resolution

Head = [80, 100, 80, 0, 0, 0];
maxDepthFromSkin = max(Head) * 2;
d0 = 2;
depthFromSkinResolution = 1;

global depthDoseLUT;
depthDoseLUT = Compute_Depth_Dose(maxDepthFromSkin, d0, depthFromSkinResolution);
disp(depthDoseLUT)
