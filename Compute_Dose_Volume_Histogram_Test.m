% Bo Chen
% 10190141
% 14bc57
 
% CISC 330
% December 22nd, 2017 
% Assignment 4: Gamma Knife Radiosurgery

% Compute_Dose_Volume_Histogram_Test Draw tests Compute_Dose_Volume_Histogram

Helmet = [10, 15];
Head = [80, 100, 80, 0, 0, 0];
PTV = [15, 30, 0, 15];
OAR = [15, 0, 30, 45];
isocenterPoint = [0,0,0];

[OARdose, PTVdose] = Compute_Dose_Volume_Histogram(Head, Helmet, PTV, OAR, isocenterPoint);

figure;
histogram1 = histogram(OARdose);
title('OAR');
xlabel('Radiation dose');
ylabel('Number of points');

figure;
histogram2 = histogram(PTVdose);
title('PTV');
xlabel('Radiation dose');
ylabel('Number of points');