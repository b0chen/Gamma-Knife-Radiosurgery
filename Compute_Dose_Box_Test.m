% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Dose_Box_Test tests Compute_Dose_Box

PTV = [15, 30, 0, 15];
OAR = [15, 0, 30, 45];

global doseBox
doseBox = Compute_Dose_Box(PTV, OAR)