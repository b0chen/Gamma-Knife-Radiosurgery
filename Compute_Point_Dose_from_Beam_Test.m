% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Point_Dose_from_Beam_Test tests Compute_Point_Dose_from_Beam
% with beam_longitude {0, 90} and beam_latitude = {0, 90} values and
% with a fake isocenter_point that coincides with the center of the head.
% Output: doseTest1, doseTest2, doseTest3, doseTest4

disp('Computed radiation doses [0,0,0]');
disp('Isocenter point [0,0,0]');

Helmet = [10, 15];
Head = [80, 100, 80, 0, 0, 0];
PTV = [15, 30, 0, 15];
OAR = [15, 0, 30, 45];

Point = [0,0,0];
Isocenter = [0,0,0];

disp('Longitude 0 , Latitude 0');
doseTest1 = Compute_Point_Dose_from_Beam(Head,Helmet(2),0,0,Isocenter,Point)

disp('Longitude 0 , Latitude 90');
doseTest2 = Compute_Point_Dose_from_Beam(Head,Helmet(2),0,90,Isocenter,Point)

disp('Longitude 90 , Latitude 0');
doseTest3 = Compute_Point_Dose_from_Beam(Head,Helmet(2),90,0,Isocenter,Point)

disp('Longitude 90 , Latitude 90');
doseTest4 = Compute_Point_Dose_from_Beam(Head,Helmet(2),90,90,Isocenter,Point)

global radialDoseLUT;
% disp(radialDoseLUT);
global depthDoseLUT;
% disp(depthDoseLUT);
